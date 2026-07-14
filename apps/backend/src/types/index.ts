/**
 * ==========================================================
 * CloudForge DevOps Platform
 * Global TypeScript Types
 * ==========================================================
 */

export interface ApiResponse<T = unknown> {
  success: boolean;
  message: string;
  data?: T;
  error?: string;
}

export interface HealthResponse {
  status: "UP" | "DOWN";
  service: string;
  version: string;
  environment: string;
  uptime: number;
  timestamp: string;
}

export interface User {
  _id?: string;
  name: string;
  email: string;
  password?: string;
  role: "admin" | "developer" | "viewer";
  createdAt?: Date;
  updatedAt?: Date;
}

export interface Project {
  _id?: string;
  name: string;
  description: string;
  version: string;
  environment: "development" | "staging" | "production";
  status: "Running" | "Stopped" | "Failed";
  createdAt?: Date;
  updatedAt?: Date;
}

export interface Service {
  _id?: string;
  name: string;
  technology: string;
  port: number;
  status: "Running" | "Stopped";
  createdAt?: Date;
}

export interface Deployment {
  _id?: string;
  application: string;
  version: string;
  deploymentType: "CI/CD" | "Manual";
  deployedBy: string;
  environment: string;
  status: "Success" | "Failed" | "Pending";
  createdAt?: Date;
}

export interface Metric {
  cpu: string;
  memory: string;
  disk: string;
  pods: number;
  containers: number;
  cluster: string;
  timestamp: Date;
}

export interface LogEntry {
  service: string;
  level: "INFO" | "WARN" | "ERROR";
  message: string;
  timestamp: Date;
}

export interface EnvironmentConfig {
  NODE_ENV: string;
  PORT: number;
  CLIENT_URL: string;
  MONGO_URI: string;
}

export interface PaginationQuery {
  page?: number;
  limit?: number;
}

export interface PaginationResult<T> {
  data: T[];
  total: number;
  page: number;
  limit: number;
  totalPages: number;
}