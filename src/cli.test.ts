import { describe, it, expect } from 'vitest';
import { execa } from 'execa';
import path from 'node:path';

// Use compiled JS for CLI tests to avoid .ts extension issues
const cliPath = path.resolve(__dirname, '../dist/cli.js');

describe('cli', () => {
  it('prints sum of two numbers', async () => {
    const { stdout } = await execa('node', [cliPath, '4', '7']);
    expect(stdout).toBe('11');
  });

  it('shows help on no input', async () => {
    const { stderr, exitCode } = await execa('node', [cliPath], { reject: false });
    expect(stderr).toMatch(/missing required argument 'numA'/);
    expect(exitCode).toBe(1);
  });

  it('shows usage on invalid input', async () => {
    const { stderr, exitCode } = await execa('node', [cliPath, 'foo', 'bar'], { reject: false });
    expect(stderr).toMatch(/Usage: cli/);
    expect(exitCode).toBe(1);
  });
});