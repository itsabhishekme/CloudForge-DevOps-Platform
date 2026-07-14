/**
 * ==========================================================
 * CloudForge DevOps Platform
 * Logger Utility
 * ==========================================================
 */

type LogLevel = "INFO" | "WARN" | "ERROR" | "DEBUG";

class Logger {
  private format(level: LogLevel, message: string): string {
    const timestamp = new Date().toISOString();
    return `[${timestamp}] [${level}] ${message}`;
  }

  info(message: string): void {
    console.log(this.format("INFO", message));
  }

  warn(message: string): void {
    console.warn(this.format("WARN", message));
  }

  error(message: string, error?: unknown): void {
    console.error(this.format("ERROR", message));

    if (error) {
      console.error(error);
    }
  }

  debug(message: string): void {
    if (process.env.NODE_ENV !== "production") {
      console.log(this.format("DEBUG", message));
    }
  }

  success(message: string): void {
    console.log(`\x1b[32m${this.format("INFO", `✔ ${message}`)}\x1b[0m`);
  }

  startup(): void {
    console.log("\n==============================================");
    console.log("🚀 CloudForge DevOps Platform");
    console.log("==============================================");
    console.log(`Environment : ${process.env.NODE_ENV || "development"}`);
    console.log(`Port        : ${process.env.PORT || 5000}`);
    console.log("==============================================\n");
  }

  shutdown(): void {
    console.log("\n==============================================");
    console.log("🛑 CloudForge Server Stopped");
    console.log("==============================================\n");
  }
}

const logger = new Logger();

export default logger;