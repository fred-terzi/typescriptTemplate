import { describe, it, expect } from 'vitest';
import { add } from './core';

describe('core', () => {
  it('add() adds two numbers', () => {
    expect(add(2, 3)).toBe(5);
  });
});