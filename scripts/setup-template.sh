#!/usr/bin/env bash

# Exit on error
set -e

trap 'echo "An error occurred during setup."; exit 1' ERR

# Always operate from the script's parent directory (project root)
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
cd "$SCRIPT_DIR/.."

# Initialize git and npm
GIT_INIT=false
if [ ! -d .git ]; then
  echo "Initializing git repository..."
  git init
  GIT_INIT=true
fi
if [ ! -f package.json ]; then
  echo "Initializing npm package..."
  npm init -y
fi

# Get folder name for package name
PKG_NAME=$(basename "$PWD")

# Add bin field to package.json for CLI
node <<EOF
const fs = require('fs');
const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
pkg.bin = pkg.bin || {};
pkg.bin["$PKG_NAME"] = "./dist/cli.js";
fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');
EOF

# Add build and test scripts to package.json
node <<EOF
const fs = require('fs');
const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
pkg.scripts = pkg.scripts || {};
pkg.scripts.build = "tsc";
pkg.scripts.test = "vitest run --coverage";
fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');
EOF

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
    "module": "NodeNext",
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

# Create src directory and starter files
mkdir -p src/types src/core src/cli
[ -f src/core/core.ts ] || echo '// Core API implementation' > src/core/core.ts
[ -f src/core/core.test.ts ] || echo '// Core API tests' > src/core/core.test.ts
[ -f src/cli/cli.ts ] || echo '// CLI entry point' > src/cli/cli.ts
[ -f src/cli/cli.test.ts ] || echo '// CLI tests' > src/cli/cli.test.ts
[ -f src/types/index.ts ] || echo '// Type definitions' > src/types/index.ts
[ -f src/setupTests.ts ] || echo '// You can add global setup for Vitest here if needed' > src/setupTests.ts

echo "All dependencies installed!"

echo "You can now run:"
echo "  npm run build"
echo "  npm run test"
