# ── Stage 1: Builder ──────────────────────────────────────────
FROM node:18 AS builder
WORKDIR /app

COPY package*.json ./
COPY nx.json ./
COPY tsconfig.base.json ./

RUN npm ci --legacy-peer-deps

COPY . .

# Generate Prisma client before building
ENV PRISMA_CLI_QUERY_ENGINE_TYPE=binary
ENV PRISMA_CLIENT_ENGINE_TYPE=binary
RUN npx prisma generate

# Build Angular app for production
RUN npx nx build compito --prod

# ── Stage 2: Serve with Nginx ─────────────────────────────────
FROM nginx:alpine AS runtime

COPY --from=builder /app/dist/apps/compito /usr/share/nginx/html
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:80 || exit 1

CMD ["nginx", "-g", "daemon off;"]