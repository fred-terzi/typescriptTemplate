#!/usr/bin/env bash

# Exit on error
set -e

trap 'echo "An error occurred during setup."; exit 1' ERR

echo "Installing TypeScript template dependencies..."

npm install --save-dev \
  typescript \
  ts-node \
  vitest \
  @vitest/coverage-v8 \
  c8 \
  execa \
  vite \
  reqtext \
  @types/node

npm install commander

echo "Creating .gitignore..."
cat > .gitignore <<EOL
node_modules/
.reqt/
dist/
.env
*.log
coverage/
.vscode/
.DS_Store
npm-debug.log*
EOL

echo "Creating tsconfig.json..."
cat > tsconfig.json <<EOL
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "NodeNext",
    "outDir": "dist",
    "rootDir": "src",
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true,
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "strict": true,
    "skipLibCheck": true,
    "types": ["node"]
  },
  "include": ["src/**/*.ts"],
  "exclude": ["node_modules", "dist", "coverage", "src/**/*.test.ts"]
}
EOL

echo "All dependencies installed!"

echo "You can now run:"
echo "  npm run build"
echo "  npm run test"
