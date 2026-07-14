import { z } from "zod";

/**
 * Health Check Response Schema
 */
export const HealthResponseSchema = z.object({
  success: z.boolean(),
  status: z.enum(["UP", "DOWN"]),
  service: z.string(),
  version: z.string(),
  environment: z.string(),
  uptime: z.number(),
  timestamp: z.string(),
});

/**
 * API Status Schema
 */
export const ApiStatusSchema = z.object({
  success: z.boolean(),
  message: z.string(),
  version: z.string(),
  timestamp: z.string(),
});

/**
 * Environment Variables Schema
 */
export const EnvironmentSchema = z.object({
  PORT: z.string().optional(),
  NODE_ENV: z
    .enum(["development", "production", "test"])
    .default("development"),
  MONGO_URI: z.string().min(1, "MongoDB URI is required"),
  CLIENT_URL: z.string().url().optional(),
});

/**
 * Validate Environment Variables
 */
export function validateEnvironment(env: NodeJS.ProcessEnv) {
  return EnvironmentSchema.parse(env);
}

/**
 * Validate Health Response
 */
export function validateHealthResponse(data: unknown) {
  return HealthResponseSchema.parse(data);
}

/**
 * Validate API Status Response
 */
export function validateApiStatus(data: unknown) {
  return ApiStatusSchema.parse(data);
}