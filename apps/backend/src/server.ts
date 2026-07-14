import express, { Application, Request, Response } from "express";
import cors from "cors";
import helmet from "helmet";
import morgan from "morgan";
import dotenv from "dotenv";
import mongoose from "mongoose";

dotenv.config();

const app: Application = express();

const PORT = Number(process.env.PORT) || 5000;
const CLIENT_URL = process.env.CLIENT_URL || "http://localhost:3000";
const MONGO_URI =
  process.env.MONGO_URI || "mongodb://localhost:27017/cloudforge";

/* -------------------------------------------------------------------------- */
/* Middleware                                                                  */
/* -------------------------------------------------------------------------- */

app.use(
  cors({
    origin: CLIENT_URL,
    credentials: true,
  })
);

app.use(helmet());
app.use(morgan("dev"));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

/* -------------------------------------------------------------------------- */
/* Database                                                                     */
/* -------------------------------------------------------------------------- */

async function connectDatabase(): Promise<void> {
  try {
    await mongoose.connect(MONGO_URI);

    console.log("MongoDB connected successfully");
  } catch (error) {
    console.error("MongoDB connection failed");
    console.error(error);

    process.exit(1);
  }
}

/* -------------------------------------------------------------------------- */
/* Routes                                                                       */
/* -------------------------------------------------------------------------- */

app.get("/", (_req: Request, res: Response) => {
  res.status(200).json({
    success: true,
    project: "CloudForge DevOps Platform",
    version: "1.0.0",
    message: "Backend API is running.",
    timestamp: new Date().toISOString(),
  });
});

app.get("/health", (_req: Request, res: Response) => {
  res.status(200).json({
    status: "UP",
    service: "backend",
    uptime: process.uptime(),
    memory: process.memoryUsage(),
    timestamp: new Date().toISOString(),
  });
});

app.get("/api", (_req: Request, res: Response) => {
  res.status(200).json({
    success: true,
    message: "Welcome to CloudForge DevOps Platform API",
  });
});

app.get("/api/info", (_req: Request, res: Response) => {
  res.status(200).json({
    application: "CloudForge DevOps Platform",
    frontend: "Next.js",
    backend: "Express",
    database: "MongoDB",
    deployment: "Docker + Kubernetes",
    cloud: "AWS",
  });
});

/* -------------------------------------------------------------------------- */
/* 404 Handler                                                                  */
/* -------------------------------------------------------------------------- */

app.use((_req: Request, res: Response) => {
  res.status(404).json({
    success: false,
    message: "Route not found",
  });
});

/* -------------------------------------------------------------------------- */
/* Server                                                                       */
/* -------------------------------------------------------------------------- */

async function startServer() {
  await connectDatabase();

  app.listen(PORT, () => {
    console.log("");
    console.log("==============================================");
    console.log(" CloudForge DevOps Platform");
    console.log("==============================================");
    console.log(` Server      : http://localhost:${PORT}`);
    console.log(` Health      : http://localhost:${PORT}/health`);
    console.log(` API         : http://localhost:${PORT}/api`);
    console.log(` Environment : ${process.env.NODE_ENV || "development"}`);
    console.log("==============================================");
    console.log("");
  });
}

startServer();