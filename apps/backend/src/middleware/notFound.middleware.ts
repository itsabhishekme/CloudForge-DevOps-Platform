import { Request, Response, NextFunction } from "express";

export const notFoundMiddleware = (
  req: Request,
  res: Response,
  _next: NextFunction
): void => {
  res.status(404).json({
    success: false,
    error: {
      code: 404,
      message: "Resource not found",
      method: req.method,
      path: req.originalUrl,
      timestamp: new Date().toISOString(),
    },
  });
};

export default notFoundMiddleware;