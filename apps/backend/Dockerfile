# ==========================================================
# CloudForge DevOps Platform
# Backend Dockerfile
# Node.js + Express + TypeScript
# ==========================================================

############################
# Stage 1 - Dependencies
############################
FROM node:22-alpine AS dependencies

WORKDIR /app

COPY package*.json ./

RUN npm ci

############################
# Stage 2 - Build
############################
FROM node:22-alpine AS builder

WORKDIR /app

COPY --from=dependencies /app/node_modules ./node_modules
COPY . .

RUN npm run build

############################
# Stage 3 - Production
############################
FROM node:22-alpine AS production

WORKDIR /app

ENV NODE_ENV=production
ENV PORT=5000

COPY package*.json ./

RUN npm ci --omit=dev

COPY --from=builder /app/dist ./dist

EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
CMD wget --quiet --tries=1 --spider http://localhost:5000/health || exit 1

CMD ["node", "dist/server.js"]