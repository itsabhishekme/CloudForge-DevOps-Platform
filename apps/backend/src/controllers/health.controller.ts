import { Request, Response } from "express";
import mongoose from "mongoose";

export class HealthController {
  /**
   * GET /health
   * Health check endpoint
   */
  static getHealth(_req: Request, res: Response): void {
    const health = {
      success: true,
      service: "CloudForge DevOps Platform API",
      status: "UP",
      version: "1.0.0",
      environment: process.env.NODE_ENV || "development",
      timestamp: new Date().toISOString(),
      uptime: `${Math.floor(process.uptime())} seconds`,
      database:
        mongoose.connection.readyState === 1 ? "Connected" : "Disconnected",
      memory: {
        rss: `${Math.round(process.memoryUsage().rss / 1024 / 1024)} MB`,
        heapTotal: `${Math.round(
          process.memoryUsage().heapTotal / 1024 / 1024
        )} MB`,
        heapUsed: `${Math.round(
          process.memoryUsage().heapUsed / 1024 / 1024
        )} MB`,
      },
    };

    res.status(200).json(health);
  }

  /**
   * GET /
   * Root endpoint
   */
  static getHome(_req: Request, res: Response): void {
    res.status(200).json({
      success: true,
      message: "Welcome to CloudForge DevOps Platform API 🚀",
      version: "1.0.0",
      documentation: "/api",
      health: "/health",
      timestamp: new Date().toISOString(),
    });
  }

  /**
   * GET /api
   * API information
   */
  static getApiInfo(_req: Request, res: Response): void {
    res.status(200).json({
      success: true,
      application: "CloudForge DevOps Platform",
      backend: "Express.js",
      language: "TypeScript",
      database: "MongoDB",
      features: [
        "REST API",
        "Docker",
        "Kubernetes",
        "Jenkins CI/CD",
        "Terraform",
        "Ansible",
        "Prometheus",
        "Grafana",
        "ELK Stack",
        "Argo CD",
      ],
      endpoints: {
        home: "/",
        health: "/health",
        api: "/api",
      },
    });
  }
}