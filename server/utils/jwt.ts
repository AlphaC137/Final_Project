import 'dotenv/config';
import jwt from "jsonwebtoken";
import { type User } from "@shared/schema";

const JWT_SECRET = process.env.JWT_SECRET;
if (!JWT_SECRET && process.env.NODE_ENV === 'production') {
  throw new Error('JWT_SECRET must be set in production environment');
}

// Fallback for development only
const SECRET_KEY = JWT_SECRET || "your-super-secret-jwt-key-development-only";

export interface JWTPayload {
  userId: number;
  email: string;
  username: string;
}

export function generateToken(user: User): string {
  const payload: JWTPayload = {
    userId: user.id,
    email: user.email,
    username: user.username,
  };
  
  return jwt.sign(payload, SECRET_KEY, { expiresIn: "7d" });
}

export function verifyToken(token: string): JWTPayload | null {
  try {
    return jwt.verify(token, SECRET_KEY) as JWTPayload;
  } catch (error) {
    return null;
  }
}
