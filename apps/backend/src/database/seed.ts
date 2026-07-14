import dotenv from "dotenv";
import mongoose from "mongoose";

dotenv.config();

const MONGO_URI =
  process.env.MONGO_URI || "mongodb://localhost:27017/cloudforge";

interface ProjectDocument {
  name: string;
  description: string;
  version: string;
  environment: string;
  status: string;
}

interface ServiceDocument {
  name: string;
  technology: string;
  port: number;
  status: string;
}

interface DeploymentDocument {
  application: string;
  version: string;
  deployedBy: string;
  environment: string;
  status: string;
}

interface MetricDocument {
  cpu: string;
  memory: string;
  disk: string;
  pods: number;
  containers: number;
}

const ProjectSchema = new mongoose.Schema<ProjectDocument>(
  {
    name: {
      type: String,
      required: true,
      unique: true,
    },
    description: String,
    version: String,
    environment: String,
    status: String,
  },
  {
    timestamps: true,
  }
);

const ServiceSchema = new mongoose.Schema<ServiceDocument>(
  {
    name: {
      type: String,
      required: true,
      unique: true,
    },
    technology: String,
    port: Number,
    status: String,
  },
  {
    timestamps: true,
  }
);

const DeploymentSchema = new mongoose.Schema<DeploymentDocument>(
  {
    application: String,
    version: String,
    deployedBy: String,
    environment: String,
    status: String,
  },
  {
    timestamps: true,
  }
);

const MetricSchema = new mongoose.Schema<MetricDocument>(
  {
    cpu: String,
    memory: String,
    disk: String,
    pods: Number,
    containers: Number,
  },
  {
    timestamps: true,
  }
);

const Project = mongoose.model("Project", ProjectSchema);
const Service = mongoose.model("Service", ServiceSchema);
const Deployment = mongoose.model("Deployment", DeploymentSchema);
const Metric = mongoose.model("Metric", MetricSchema);

async function seedDatabase() {
  try {
    console.log("Connecting to MongoDB...");

    await mongoose.connect(MONGO_URI);

    console.log("MongoDB Connected");

    await Promise.all([
      Project.deleteMany({}),
      Service.deleteMany({}),
      Deployment.deleteMany({}),
      Metric.deleteMany({}),
    ]);

    console.log("Existing data removed.");

    await Project.insertMany([
      {
        name: "CloudForge DevOps Platform",
        description:
          "End-to-end DevOps project using Docker, Kubernetes, Jenkins, Terraform and AWS.",
        version: "1.0.0",
        environment: "Production",
        status: "Running",
      },
      {
        name: "Monitoring Stack",
        description: "Prometheus & Grafana Monitoring",
        version: "1.0.0",
        environment: "Production",
        status: "Healthy",
      },
    ]);

    await Service.insertMany([
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

    await Deployment.create({
      application: "CloudForge DevOps Platform",
      version: "1.0.0",
      deployedBy: "Jenkins",
      environment: "Production",
      status: "Success",
    });

    await Metric.create({
      cpu: "12%",
      memory: "41%",
      disk: "37%",
      pods: 3,
      containers: 5,
    });

    console.log("------------------------------------");
    console.log("CloudForge Database Seed Complete");
    console.log("------------------------------------");

    process.exit(0);
  } catch (error) {
    console.error("Seed failed:", error);
    process.exit(1);
  }
}

seedDatabase();