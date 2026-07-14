

/// <reference types="node" />
import mongoose from "mongoose";
import dotenv from "dotenv";
import process from "process";

dotenv.config();

const MONGO_URI =
  process.env.MONGO_URI || "mongodb://localhost:27017/cloudforge";

interface Project {
  name: string;
  description: string;
  status: string;
  version: string;
  environment: string;
  createdAt: Date;
  updatedAt: Date;
}

interface Service {
  name: string;
  technology: string;
  port: number;
  status: string;
  createdAt: Date;
}

interface Deployment {
  application: string;
  version: string;
  deployedBy: string;
  deploymentType: string;
  environment: string;
  status: string;
  createdAt: Date;
}

interface Metric {
  cpu: string;
  memory: string;
  disk: string;
  pods: number;
  containers: number;
  cluster: string;
  timestamp: Date;
}

interface Log {
  service: string;
  level: string;
  message: string;
  timestamp: Date;
}

const ProjectSchema = new mongoose.Schema<Project>(
  {
    name: { type: String, required: true, unique: true },
    description: String,
    status: String,
    version: String,
    environment: String,
  },
  { timestamps: true }
);

const ServiceSchema = new mongoose.Schema<Service>({
  name: { type: String, required: true, unique: true },
  technology: String,
  port: Number,
  status: String,
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

const DeploymentSchema = new mongoose.Schema<Deployment>({
  application: String,
  version: String,
  deployedBy: String,
  deploymentType: String,
  environment: String,
  status: String,
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

const MetricSchema = new mongoose.Schema<Metric>({
  cpu: String,
  memory: String,
  disk: String,
  pods: Number,
  containers: Number,
  cluster: String,
  timestamp: {
    type: Date,
    default: Date.now,
  },
});

const LogSchema = new mongoose.Schema<Log>({
  service: String,
  level: String,
  message: String,
  timestamp: {
    type: Date,
    default: Date.now,
  },
});

const ProjectModel = mongoose.model("Project", ProjectSchema);
const ServiceModel = mongoose.model("Service", ServiceSchema);
const DeploymentModel = mongoose.model("Deployment", DeploymentSchema);
const MetricModel = mongoose.model("Metric", MetricSchema);
const LogModel = mongoose.model("Log", LogSchema);

async function seedDatabase() {
  try {
    console.log("Connecting to MongoDB...");

    await mongoose.connect(MONGO_URI);

    console.log("Connected.");

    await Promise.all([
      ProjectModel.deleteMany({}),
      ServiceModel.deleteMany({}),
      DeploymentModel.deleteMany({}),
      MetricModel.deleteMany({}),
      LogModel.deleteMany({}),
    ]);

    console.log("Existing data removed.");

    await ProjectModel.insertMany([
      {
        name: "CloudForge DevOps Platform",
        description:
          "Production-ready DevOps platform using Docker, Kubernetes, Jenkins, Terraform and AWS.",
        status: "Running",
        version: "1.0.0",
        environment: "Production",
      },
      {
        name: "Monitoring Stack",
        description: "Prometheus + Grafana monitoring.",
        status: "Healthy",
        version: "1.0.0",
        environment: "Production",
      },
    ]);

    await ServiceModel.insertMany([
      {
        name: "Frontend",
        technology: "Next.js",
        port: 3000,
        status: "Running",
      },
      {
        name: "Backend",
        technology: "Express",
        port: 5000,
        status: "Running",
      },
      {
        name: "MongoDB",
        technology: "MongoDB",
        port: 27017,
        status: "Running",
      },
    ]);

    await DeploymentModel.create({
      application: "CloudForge DevOps Platform",
      version: "1.0.0",
      deployedBy: "Jenkins",
      deploymentType: "CI/CD",
      environment: "Production",
      status: "Success",
    });

    await MetricModel.create({
      cpu: "18%",
      memory: "42%",
      disk: "51%",
      pods: 3,
      containers: 5,
      cluster: "cloudforge-cluster",
    });

    await LogModel.create({
      service: "backend",
      level: "INFO",
      message: "Database seeded successfully.",
    });

    console.log("--------------------------------");
    console.log("Database Seed Completed");
    console.log("--------------------------------");

    process.exit(0);
  } catch (error) {
    console.error("Seed failed:", error);
    process.exit(1);
  }
}

seedDatabase();