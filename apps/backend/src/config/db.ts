import mongoose from "mongoose";
import dotenv from "dotenv";

dotenv.config();

const MONGO_URI =
  process.env.MONGO_URI || "mongodb://localhost:27017/cloudforge";

/**
 * Connect to MongoDB
 */
export async function connectDatabase(): Promise<void> {
  try {
    mongoose.set("strictQuery", true);

    await mongoose.connect(MONGO_URI);

    console.log("==========================================");
    console.log("🍃 MongoDB Connected Successfully");
    console.log(`📦 Database : ${mongoose.connection.name}`);
    console.log(`🌐 Host     : ${mongoose.connection.host}`);
    console.log("==========================================");

    mongoose.connection.on("connected", () => {
      console.log("✅ MongoDB connection established.");
    });

    mongoose.connection.on("error", (error) => {
      console.error("❌ MongoDB connection error:", error);
    });

    mongoose.connection.on("disconnected", () => {
      console.warn("⚠️ MongoDB disconnected.");
    });

    process.on("SIGINT", async () => {
      await mongoose.connection.close();

      console.log("\n🛑 MongoDB connection closed.");
      process.exit(0);
    });
  } catch (error) {
    console.error("==========================================");
    console.error("❌ Failed to connect to MongoDB");
    console.error(error);
    console.error("==========================================");

    process.exit(1);
  }
}

/**
 * Disconnect from MongoDB
 */
export async function disconnectDatabase(): Promise<void> {
  try {
    await mongoose.disconnect();
    console.log("✅ MongoDB disconnected.");
  } catch (error) {
    console.error("❌ Error disconnecting MongoDB:", error);
  }
}