import type { Express } from "express";
import { createServer, type Server } from "http";
import bcrypt from "bcrypt";
import { getStorage } from "./storage";
import { authenticateToken, type AuthenticatedRequest } from "./middleware/auth";
import { generateToken } from "./utils/jwt";
import { 
  insertUserSchema, 
  loginSchema, 
  insertRecipeSchema, 
  updateRecipeSchema,
  insertCommentSchema
} from "@shared/schema";
import Comment from "./models/Comment";

export async function registerRoutes(app: Express): Promise<Server> {
  const storage = getStorage();

  // Auth routes
  app.post("/api/auth/register", async (req, res) => {
    try {
      const userData = insertUserSchema.parse(req.body);
      
      // Check if user already exists
      const existingUser = await storage.getUserByEmail(userData.email);
      if (existingUser) {
        return res.status(400).json({ message: "User already exists" });
      }

      // Hash password
      const hashedPassword = await bcrypt.hash(userData.password, 10);
      
      // Create user
      const user = await storage.createUser({
        ...userData,
        password: hashedPassword,
      });

      // Generate token
      const token = generateToken(user);
      
      res.status(201).json({
        message: "User created successfully",
        token,
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
        },
      });
    } catch (error) {
      res.status(400).json({ message: "Invalid input data" });
    }
  });

  app.post("/api/auth/login", async (req, res) => {
    try {
      const loginData = loginSchema.parse(req.body);
      
      // Find user
      const user = await storage.getUserByEmail(loginData.email);
      if (!user) {
        return res.status(401).json({ message: "Invalid credentials" });
      }

      // Check password
      const isPasswordValid = await bcrypt.compare(loginData.password, user.password);
      if (!isPasswordValid) {
        return res.status(401).json({ message: "Invalid credentials" });
      }

      // Generate token
      const token = generateToken(user);
      
      res.json({
        message: "Login successful",
        token,
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
        },
      });
    } catch (error) {
      res.status(400).json({ message: "Invalid input data" });
    }
  });

  // Get current user
  app.get("/api/auth/me", authenticateToken, async (req: AuthenticatedRequest, res) => {
    try {
      const user = await storage.getUser(req.user!.userId);
      if (!user) {
        return res.status(404).json({ message: "User not found" });
      }

      res.json({
        id: user.id,
        username: user.username,
        email: user.email,
      });
    } catch (error) {
      res.status(500).json({ message: "Server error" });
    }
  });

  // Recipe routes
  app.get("/api/recipes/public", async (req, res) => {
    try {
      const recipes = await storage.getPublicRecipes();
      res.json(recipes);
    } catch (error) {
      res.status(500).json({ message: "Server error" });
    }
  });

  app.get("/api/recipes/my", authenticateToken, async (req: AuthenticatedRequest, res) => {
    try {
      const recipes = await storage.getUserRecipes(req.user!.userId);
      res.json(recipes);
    } catch (error) {
      res.status(500).json({ message: "Server error" });
    }
  });

  app.get("/api/recipes/:id", async (req, res) => {
    try {
      const id = parseInt(req.params.id);
      const recipe = await storage.getRecipeWithAuthor(id);
      
      if (!recipe) {
        return res.status(404).json({ message: "Recipe not found" });
      }

      res.json(recipe);
    } catch (error) {
      res.status(500).json({ message: "Server error" });
    }
  });

  app.post("/api/recipes", authenticateToken, async (req: AuthenticatedRequest, res) => {
    try {
      const recipeData = insertRecipeSchema.parse(req.body);
      
      const recipe = await storage.createRecipe({
        ...recipeData,
        authorId: req.user!.userId,
      });

      res.status(201).json(recipe);
    } catch (error) {
      res.status(400).json({ message: "Invalid recipe data" });
    }
  });

  app.put("/api/recipes/:id", authenticateToken, async (req: AuthenticatedRequest, res) => {
    try {
      const id = parseInt(req.params.id);
      const updateData = updateRecipeSchema.parse(req.body);
      
      // Check if recipe exists and belongs to user
      const existingRecipe = await storage.getRecipe(id);
      if (!existingRecipe) {
        return res.status(404).json({ message: "Recipe not found" });
      }
      
      if (existingRecipe.authorId !== req.user!.userId) {
        return res.status(403).json({ message: "Not authorized to update this recipe" });
      }

      const updatedRecipe = await storage.updateRecipe(id, updateData);
      res.json(updatedRecipe);
    } catch (error) {
      res.status(400).json({ message: "Invalid recipe data" });
    }
  });

  app.delete("/api/recipes/:id", authenticateToken, async (req: AuthenticatedRequest, res) => {
    try {
      const id = parseInt(req.params.id);
      
      // Check if recipe exists and belongs to user
      const existingRecipe = await storage.getRecipe(id);
      if (!existingRecipe) {
        return res.status(404).json({ message: "Recipe not found" });
      }
      
      if (existingRecipe.authorId !== req.user!.userId) {
        return res.status(403).json({ message: "Not authorized to delete this recipe" });
      }

      const deleted = await storage.deleteRecipe(id);
      if (deleted) {
        res.json({ message: "Recipe deleted successfully" });
      } else {
        res.status(500).json({ message: "Failed to delete recipe" });
      }
    } catch (error) {
      res.status(500).json({ message: "Server error" });
    }
  });

  app.get("/api/recipes/search", async (req, res) => {
    try {
      const query = req.query.q as string;
      if (!query) {
        return res.status(400).json({ message: "Search query required" });
      }

      const recipes = await storage.searchRecipes(query);
      res.json(recipes);
    } catch (error) {
      res.status(500).json({ message: "Server error" });
    }
  });

  // Comment routes
  app.get("/api/recipes/:id/comments", async (req, res) => {
    try {
      const recipeId = req.params.id;
      
      const comments = await Comment.find({ recipeId })
        .populate('authorId', 'username')
        .sort({ createdAt: -1 });

      const commentsWithAuthors = comments.map(comment => {
        const populatedComment = comment as any;
        return {
          id: comment.id,
          text: comment.text,
          recipeId: comment.recipeId,
          authorId: comment.authorId,
          createdAt: comment.createdAt,
          author: {
            id: populatedComment.authorId._id.toString(),
            username: populatedComment.authorId.username,
          },
        };
      });

      res.json(commentsWithAuthors);
    } catch (error) {
      res.status(500).json({ message: "Server error" });
    }
  });

  app.post("/api/recipes/:id/comments", authenticateToken, async (req: AuthenticatedRequest, res) => {
    try {
      const recipeId = req.params.id;
      const commentData = insertCommentSchema.parse(req.body);
      
      const comment = new Comment({
        ...commentData,
        recipeId,
        authorId: req.user!.userId,
      });

      const savedComment = await comment.save();
      await savedComment.populate('authorId', 'username');

      const populatedComment = savedComment as any;
      const commentWithAuthor = {
        id: savedComment.id,
        text: savedComment.text,
        recipeId: savedComment.recipeId,
        authorId: savedComment.authorId,
        createdAt: savedComment.createdAt,
        author: {
          id: populatedComment.authorId._id.toString(),
          username: populatedComment.authorId.username,
        },
      };

      // Emit real-time update
      const io = app.get('io');
      if (io) {
        io.to(`recipe-${recipeId}`).emit('comment-added', commentWithAuthor);
      }

      res.status(201).json(commentWithAuthor);
    } catch (error) {
      res.status(400).json({ message: "Invalid comment data" });
    }
  });

  app.post("/api/recipes/:id/like", authenticateToken, async (req: AuthenticatedRequest, res) => {
    try {
      const id = parseInt(req.params.id);
      const recipe = await storage.likeRecipe(id);
      
      if (!recipe) {
        return res.status(404).json({ message: "Recipe not found" });
      }

      // Emit real-time like update
      const io = app.get('io');
      if (io) {
        io.to(`recipe-${id}`).emit('like-updated', {
          recipeId: id,
          likes: recipe.likes,
          likedBy: {
            id: req.user!.userId,
            username: req.user!.username,
          },
        });
      }

      res.json(recipe);
    } catch (error) {
      res.status(500).json({ message: "Server error" });
    }
  });

  const httpServer = createServer(app);
  return httpServer;
}