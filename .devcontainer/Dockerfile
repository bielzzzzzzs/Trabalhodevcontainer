# Base image with Node.js and common development tools
FROM mcr.microsoft.com/devcontainers/javascript-node:20

# Install additional tools and dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    postgresql-client \
    python3-pip \
    python3-venv \
    curl \
    git \
    vim \
    nano \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install global npm packages for development
RUN npm install -g \
    typescript \
    ts-node \
    nodemon \
    prisma \
    @nestjs/cli \
    create-react-app \
    vite \
    eslint \
    prettier

# Create workspace directory
RUN mkdir -p /workspace && chown -R node:node /workspace

# Set working directory
WORKDIR /workspace

# Switch to node user for security
USER node
