module.exports = {
  reporter: ['text', 'html'],
  all: true,
  include: ['src/**/*.ts'],
  exclude: ['**/*.test.ts'],
  extension: ['.ts'],
  lines: 80,
  functions: 80,
  branches: 80,
  statements: 80,
};