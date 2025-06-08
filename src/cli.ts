#!/usr/bin/env node
// src/cli.ts

import { Command } from 'commander';
import { add } from './core.js';

const program = new Command();

program
  .name('cli')
  .description('A simple CLI for adding two numbers')
  .version('1.0.0');

program
  .argument('<numA>', 'First number')
  .argument('<numB>', 'Second number')
  .action((numA, numB) => {
    const a = Number(numA);
    const b = Number(numB);
    if (isNaN(a) || isNaN(b)) {
      console.error('Usage: cli <numA> <numB>');
      process.exit(1);
    }
    console.log(add(a, b));
  });

program.parse(process.argv);