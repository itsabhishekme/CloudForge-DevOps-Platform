/*
==========================================================
 CloudForge DevOps Platform
 MongoDB Initialization Script
==========================================================
*/

db = db.getSiblingDB("cloudforge");

// ==========================================================
// Create Application User
// ==========================================================

db.createUser({
  user: "cloudforge",
  pwd: "cloudforge123",
  roles: [
    {
      role: "readWrite",
      db: "cloudforge",
    },
  ],
});

print("✅ Database user created");

// ==========================================================
// Projects Collection
// ==========================================================

db.createCollection("projects");

db.projects.insertMany([
  {
    name: "CloudForge DevOps Platform",
    description:
      "Production-ready DevOps platform using Docker, Kubernetes, Jenkins, Terraform and AWS.",
    status: "Running",
    version: "1.0.0",
    environment: "Production",
    createdAt: new Date(),
    updatedAt: new Date(),
  },
  {
    name: "Monitoring Stack",
    description:
      "Prometheus and Grafana monitoring services.",
    status: "Healthy",
    version: "1.0.0",
    environment: "Production",
    createdAt: new Date(),
    updatedAt: new Date(),
  },
]);

// ==========================================================
// Services Collection
// ==========================================================

db.createCollection("services");

db.services.insertMany([
  {
    name: "Frontend",
    technology: "Next.js",
    port: 3000,
    status: "Running",
    createdAt: new Date(),
  },
  {
    name: "Backend",
    technology: "Node.js",
    port: 5000,
    status: "Running",
    createdAt: new Date(),
  },
  {
    name: "MongoDB",
    technology: "MongoDB",
    port: 27017,
    status: "Running",
    createdAt: new Date(),
  },
]);

// ==========================================================
// Deployments Collection
// ==========================================================

db.createCollection("deployments");

db.deployments.insertOne({
  application: "CloudForge DevOps Platform",
  version: "1.0.0",
  environment: "Production",
  deployedBy: "Jenkins",
  deploymentType: "CI/CD",
  status: "Success",
  createdAt: new Date(),
});

// ==========================================================
// Metrics Collection
// ==========================================================

db.createCollection("metrics");

db.metrics.insertOne({
  cpu: "12%",
  memory: "38%",
  disk: "44%",
  pods: 3,
  containers: 5,
  cluster: "cloudforge-cluster",
  timestamp: new Date(),
});

// ==========================================================
// Logs Collection
// ==========================================================

db.createCollection("logs");

db.logs.insertOne({
  service: "backend",
  level: "INFO",
  message: "CloudForge initialized successfully.",
  timestamp: new Date(),
});

// ==========================================================
// Create Indexes
// ==========================================================

db.projects.createIndex({ name: 1 }, { unique: true });

db.services.createIndex({ name: 1 }, { unique: true });

db.deployments.createIndex({ createdAt: -1 });

db.logs.createIndex({ timestamp: -1 });

db.metrics.createIndex({ timestamp: -1 });

print("✅ Collections created");
print("✅ Sample data inserted");
print("✅ Indexes created");
print("🚀 CloudForge database initialized successfully");