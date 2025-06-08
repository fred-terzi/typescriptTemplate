// This file exports TypeScript interfaces and types used throughout the project, ensuring type safety and clarity in the code. 

export interface Command {
    name: string;
    description: string;
    execute(args: string[]): void;
}

export interface Config {
    [key: string]: any;
}

export type UserInput = {
    [key: string]: string | number | boolean;
};