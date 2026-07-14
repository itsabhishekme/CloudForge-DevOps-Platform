import { NextFunction, Request, Response } from "express";

export class AppError extends Error {
  public readonly statusCode: number;
  public readonly isOperational: boolean;

  constructor(message: string, statusCode = 500) {
    super(message);

    this.statusCode = statusCode;
    this.isOperational = true;

    Error.captureStackTrace(this, this.constructor);
  }
}

export function errorHandler(
  err: Error | AppError,
  req: Request,
  res: Response,
  _next: NextFunction
): void {
  const statusCode =
    err instanceof AppError ? err.statusCode : 500;

  const message =
    err instanceof AppError
      ? err.message
      : "Internal Server Error";

  console.error("=================================");
  console.error("Error:", err.message);
  console.error("Method:", req.method);
  console.error("URL:", req.originalUrl);
  console.error("Time:", new Date().toISOString());
  console.error("=================================");

  res.status(statusCode).json({
    success: false,
    error: {
      message,
      statusCode,
    },
    timestamp: new Date().toISOString(),
    path: req.originalUrl,
    method: req.method,
  });
}