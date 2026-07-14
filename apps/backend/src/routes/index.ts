import { Router } from "express";
import healthRoutes from "./health.routes";

const router = Router();

/**
 * Root API
 * GET /api
 */
router.get("/", (_req, res) => {
  res.status(200).json({
    success: true,
    application: "CloudForge DevOps Platform",
    version: "1.0.0",
    message: "Welcome to the CloudForge API",
    timestamp: new Date().toISOString(),
  });
});

/**
 * Health Routes
 * GET /api/health
 */
router.use("/health", healthRoutes);

export default router;