import dotenv from "dotenv";
import path from "path";

// Load environment variables
dotenv.config({
  path: path.resolve(process.cwd(), ".env"),
});

interface Environment {
  NODE_ENV: string;
  PORT: number;
  CLIENT_URL: string;
  MONGO_URI: string;
  JWT_SECRET: string;
  LOG_LEVEL: string;
}

const env: Environment = {
  NODE_ENV: process.env.NODE_ENV || "development",

  PORT: Number(process.env.PORT) || 5000,

  CLIENT_URL: process.env.CLIENT_URL || "http://localhost:3000",

  MONGO_URI:
    process.env.MONGO_URI ||
    "mongodb://localhost:27017/cloudforge",

  JWT_SECRET:
    process.env.JWT_SECRET ||
    "cloudforge-super-secret-key",

  LOG_LEVEL: process.env.LOG_LEVEL || "info",
};

// Validate required environment variables
const requiredVariables = [
  "PORT",
  "CLIENT_URL",
  "MONGO_URI",
];

requiredVariables.forEach((key) => {
  if (!process.env[key]) {
    console.warn(
      `⚠ Environment variable '${key}' is not set. Using default value.`
    );
  }
});

export default env;