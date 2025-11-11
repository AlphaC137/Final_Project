# TasteBase - Recipe Sharing Platform

<div align="center">

**A modern, full-stack recipe sharing and management platform built with the MERN stack**

[![React](https://img.shields.io/badge/React-18-blue?logo=react)](https://reactjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.6-blue?logo=typescript)](https://www.typescriptlang.org/)
[![Express](https://img.shields.io/badge/Express-4.21-green?logo=express)](https://expressjs.com/)
[![MongoDB](https://img.shields.io/badge/MongoDB-6.17-green?logo=mongodb)](https://www.mongodb.com/)
[![Socket.io](https://img.shields.io/badge/Socket.io-4.8-black?logo=socket.io)](https://socket.io/)
[![TailwindCSS](https://img.shields.io/badge/TailwindCSS-3.4-cyan?logo=tailwindcss)](https://tailwindcss.com/)

[Live Demo](#) • [Documentation](./docs/) • [API Reference](./docs/api.md)

</div>

---

## 🎯 Overview

**TasteBase** is a comprehensive recipe management and sharing platform that enables users to create, discover, and share culinary recipes. Built with modern web technologies, it features real-time updates, advanced search capabilities, and a beautiful, responsive user interface.

### Key Features

- 🔐 **Secure Authentication** - JWT-based auth with bcrypt password hashing
- 📚 **Recipe Management** - Full CRUD operations with rich forms and validation
- 🔍 **Advanced Search** - Full-text search across titles, ingredients, and tags
- 🌐 **Real-time Updates** - Socket.io integration for instant notifications
- 📱 **Responsive Design** - Mobile-first UI built with TailwindCSS and Shadcn/UI
- 📊 **User Dashboard** - Personal recipe management with statistics
- 🏷️ **Tag System** - Organize recipes by category and dietary preferences
- 💾 **Production Database** - MongoDB Atlas integration with fallback storage

---

## 🚀 Quick Start

### Prerequisites

- **Node.js** 18.x or higher
- **npm** 8.x or higher
- **MongoDB** (optional - falls back to in-memory storage)

### Installation

```bash
# Clone the repository
git clone https://github.com/AlphaC137/Final_Project.git
cd Final_Project

# Install dependencies
npm install

# Create environment file (optional)
cat > .env << EOF
MONGODB_URI=mongodb+srv://your-connection-string
JWT_SECRET=your-super-secret-key
PORT=5000
EOF

# Start development server
npm run dev
```

The application will be available at **http://localhost:5000**

### Demo Credentials

```
Email: sarah@example.com
Password: password123
```

---

## 📁 Project Structure

```
TasteBase/
├── 📁 client/              # React frontend application
│   └── src/
│       ├── components/     # Reusable UI components
│       ├── pages/          # Route-based page components
│       ├── hooks/          # Custom React hooks (useAuth, useSocket)
│       ├── lib/            # Utilities and configurations
│       └── __tests__/      # Frontend test suites
│
├── 📁 server/              # Express backend application
│   ├── routes.ts           # API endpoints and Socket.io handlers
│   ├── storage.ts          # Storage abstraction layer
│   ├── middleware/         # Auth middleware and guards
│   ├── storage/            # Database implementations (MongoDB/InMemory)
│   ├── data/               # Mock data for development
│   └── __tests__/          # Backend test suites
│
├── 📁 shared/              # Shared TypeScript types and schemas
│   └── schema.ts           # Zod schemas and type definitions
│
├── 📁 docs/                # Comprehensive documentation
│   ├── api.md              # API endpoint reference
│   ├── architecture.md     # System architecture details
│   ├── setup-guide.md      # Development setup instructions
│   └── user-guide.md       # End-user manual
│
└── 📄 Configuration Files
    ├── package.json        # Dependencies and scripts
    ├── tsconfig.json       # TypeScript configuration
    ├── vite.config.ts      # Vite build configuration
    ├── tailwind.config.ts  # TailwindCSS customization
    └── jest.config.js      # Testing configuration
```

---

## 🛠️ Tech Stack

### Frontend
- **React 18** - Modern UI library with hooks and concurrent features
- **TypeScript** - Type safety and enhanced developer experience
- **TailwindCSS** - Utility-first CSS framework
- **Shadcn/UI** - Accessible component library (40+ components)
- **TanStack Query** - Powerful server state management
- **React Hook Form + Zod** - Type-safe form validation
- **Wouter** - Lightweight client-side routing
- **Socket.io Client** - Real-time bidirectional communication

### Backend
- **Node.js + Express** - Fast, unopinionated web framework
- **MongoDB** - NoSQL database with Atlas cloud hosting
- **Socket.io** - Real-time WebSocket communication
- **JWT + bcrypt** - Secure authentication and password hashing
- **Zod** - Runtime schema validation
- **TypeScript** - Type-safe backend development

### Development Tools
- **Vite** - Lightning-fast build tool and dev server
- **Jest** - Testing framework for frontend and backend
- **React Testing Library** - Component testing utilities
- **Supertest** - HTTP API testing
- **ESBuild** - Fast JavaScript bundler for production

---

## 📋 Available Scripts

```bash
# Development
npm run dev          # Start dev server with hot reload

# Building
npm run build        # Build for production (frontend + backend)
npm start            # Run production build

# Testing
npm test             # Run all tests once
npm run test:watch   # Run tests in watch mode
npm run test:coverage # Generate coverage report

# Type Checking
npm run check        # TypeScript type checking

# Database
npm run db:push      # Push Drizzle schema to PostgreSQL (future)
```

---

## 🔌 API Reference

### Authentication Endpoints

```bash
POST /api/auth/register    # Create new user account
POST /api/auth/login       # Authenticate and receive JWT
GET  /api/auth/me          # Get current user (protected)
```

### Recipe Endpoints

```bash
GET    /api/recipes/public       # List all public recipes
GET    /api/recipes/my           # Get user's recipes (protected)
GET    /api/recipes/:id          # Get single recipe with author
POST   /api/recipes              # Create new recipe (protected)
PUT    /api/recipes/:id          # Update recipe (protected)
DELETE /api/recipes/:id          # Delete recipe (protected)
GET    /api/recipes/search?q=    # Search recipes by keyword
POST   /api/recipes/:id/like     # Like a recipe (protected)
```

### Socket.io Events

```javascript
// Client → Server
socket.emit('join_recipe', recipeId)
socket.emit('leave_recipe', recipeId)
socket.emit('recipe_liked', { recipeId, likes })
socket.emit('new_recipe_created', recipeData)

// Server → Client
socket.on('recipe_updated', data)
socket.on('new_recipe_available', data)
socket.on('recipe_feed_update', data)
```

**Full API documentation:** [docs/api.md](./docs/api.md)

---

## 🧪 Testing

TasteBase includes comprehensive test coverage for both frontend and backend:

### Backend Testing
- Authentication flow (register, login, token validation)
- Recipe CRUD operations
- Authorization checks (owner-only operations)
- Search functionality
- Error handling scenarios

### Frontend Testing
- Component rendering and interactions
- Custom hooks (useAuth, useSocket)
- User authentication flows
- Recipe management workflows

**Run tests:**
```bash
npm test                    # Run all tests
npm run test:coverage       # Generate coverage report
```

**Test coverage goals:**
- Backend: 80%+ coverage
- Frontend: 70%+ coverage
- Critical paths: 100% coverage

---

## 🏗️ Architecture

TasteBase follows a **layered architecture** with clear separation of concerns:

```
┌─────────────────────────────────────┐
│     Client (React + TailwindCSS)    │
│  Components → Hooks → Services      │
└──────────────┬──────────────────────┘
               │ REST API + WebSocket
┌──────────────▼──────────────────────┐
│   Server (Express + Socket.io)      │
│  Routes → Middleware → Controllers  │
└──────────────┬──────────────────────┘
               │ Storage Interface
┌──────────────▼──────────────────────┐
│       Storage Layer (Pluggable)     │
│  MongoDB (Production) / InMemory    │
└─────────────────────────────────────┘
```

### Key Design Patterns

- **Storage Abstraction**: Pluggable database backends via `IStorage` interface
- **Middleware Pattern**: Express middleware for auth, CORS, and logging
- **Service Layer**: Separation of business logic from routes
- **Custom Hooks**: Reusable React logic (useAuth, useSocket, useToast)
- **Type Safety**: End-to-end TypeScript with Zod runtime validation

**Detailed architecture:** [docs/architecture.md](./docs/architecture.md)

---

## 🚢 Deployment

### Environment Variables

Create a `.env` file in the project root:

```env
# Required for production
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/tastebase
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
NODE_ENV=production

# Optional
PORT=5000
```

### Build & Deploy

```bash
# 1. Build the application
npm run build

# 2. Set environment variables
export MONGODB_URI="your-mongodb-uri"
export JWT_SECRET="your-secret-key"
export NODE_ENV="production"

# 3. Start the server
npm start
```

### Deployment Platforms

**Recommended platforms:**
- **Frontend + Backend**: Render, Railway, Fly.io
- **Database**: MongoDB Atlas (free tier available)
- **Static Assets**: Cloudflare CDN, AWS S3

### Docker Support (Optional)

```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN npm run build
EXPOSE 5000
CMD ["npm", "start"]
```

**Deployment guide:** [docs/deployment.md](./docs/deployment.md)

---

## 📚 Documentation

### For Developers
- **[Architecture Guide](./docs/architecture.md)** - System design and patterns
- **[API Documentation](./docs/api.md)** - Complete endpoint reference
- **[Setup Guide](./docs/setup-guide.md)** - Development environment setup
- **[Testing Guide](./docs/testing.md)** - Testing strategies and examples
- **[MongoDB Integration](./docs/mongodb-integration.md)** - Database setup guide

### For Users
- **[User Guide](./docs/user-guide.md)** - Application user manual
- **[FAQ](./docs/faq.md)** - Frequently asked questions

### Project Documentation
- **[Project Overview](./docs/project-overview.md)** - High-level description
- **[Capstone Report](./CAPSTONE_COMPLETION_REPORT.md)** - 100% requirement verification

---

## 🔐 Security

TasteBase implements industry-standard security practices:

- ✅ **JWT Authentication** with 7-day token expiration
- ✅ **Password Hashing** using bcrypt with 10 salt rounds
- ✅ **Input Validation** via Zod schemas on both client and server
- ✅ **CORS Configuration** with proper origin restrictions
- ✅ **Authorization Checks** ensuring users can only modify their own data
- ✅ **SQL Injection Prevention** via parameterized queries
- ✅ **XSS Protection** via React's built-in escaping

**Security best practices:** [docs/security.md](./docs/security.md)

---

## 🤝 Contributing

We welcome contributions! Please follow these guidelines:

### Development Workflow

1. **Fork the repository** and clone locally
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes** with clear, descriptive commits
4. **Write tests** for new functionality
5. **Run the test suite**: `npm test`
6. **Submit a pull request** with a comprehensive description

### Code Style

- **TypeScript**: Follow existing patterns, use explicit types
- **React**: Use functional components with hooks
- **CSS**: Use TailwindCSS utilities, avoid custom CSS
- **Testing**: Maintain 80%+ coverage for new code

### Commit Messages

Follow conventional commits format:
```
feat: Add recipe rating system
fix: Correct search query encoding
docs: Update API documentation
test: Add tests for auth middleware
```

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](./LICENSE) file for details.

---

## 👥 Authors & Acknowledgments

**Created by:** Sydwell Lebeloane (AlphaC137)

**Built with:**
- [React](https://reactjs.org) - UI library
- [Express](https://expressjs.com) - Web framework
- [MongoDB](https://www.mongodb.com) - Database
- [Radix UI](https://radix-ui.com) - Accessible components
- [TailwindCSS](https://tailwindcss.com) - CSS framework
- [Socket.io](https://socket.io) - Real-time communication

**Special thanks to:**
- The open-source community for amazing tools and libraries
- [Shadcn/UI](https://ui.shadcn.com) for beautiful component primitives
- [Unsplash](https://unsplash.com) for recipe placeholder images

---

## 📞 Support & Contact

- **Issues**: [GitHub Issues](https://github.com/AlphaC137/Final_Project/issues)
- **Documentation**: [docs/](./docs/)
- **Email**: support@tastebase.com (project email)

---

<div align="center">

**Built with ❤️ and ☕ by the TasteBase Team**

⭐ **Star this repo** if you find it useful!

</div>
