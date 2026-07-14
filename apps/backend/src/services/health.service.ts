import os from "os";
import mongoose from "mongoose";

export interface HealthResponse {
  success: boolean;
  message: string;
  timestamp: string;
  uptime: number;
  environment: string;
  version: string;
  server: {
    platform: string;
    architecture: string;
    hostname: string;
    cpuCores: number;
    totalMemory: string;
    freeMemory: string;
    loadAverage: number[];
  };
  database: {
    status: string;
    readyState: number;
  };
  process: {
    pid: number;
    nodeVersion: string;
    memoryUsage: NodeJS.MemoryUsage;
  };
}

function bytesToMB(bytes: number): string {
  return `${(bytes / 1024 / 1024).toFixed(2)} MB`;
}

export class HealthService {
  static getHealth(): HealthResponse {
    return {
      success: true,
      message: "CloudForge DevOps Platform API is running.",
      timestamp: new Date().toISOString(),
      uptime: process.uptime(),
      environment: process.env.NODE_ENV || "development",
      version: process.env.APP_VERSION || "1.0.0",

      server: {
        platform: os.platform(),
        architecture: os.arch(),
        hostname: os.hostname(),
        cpuCores: os.cpus().length,
        totalMemory: bytesToMB(os.totalmem()),
        freeMemory: bytesToMB(os.freemem()),
        loadAverage: os.loadavg(),
      },

      database: {
        status:
          mongoose.connection.readyState === 1
            ? "Connected"
            : "Disconnected",
        readyState: mongoose.connection.readyState,
      },

      process: {
        pid: process.pid,
        nodeVersion: process.version,
        memoryUsage: process.memoryUsage(),
      },
    };
  }
}

export default HealthService;