# Optimization Engine

**Purpose**: To provide a framework for solving operations research and mathematical optimization problems.

**Related To**: [[Business Intelligence SaaS]], [[Technical Arbitrage Strategy]]

## Core Features

- **Solver Library**: A collection of optimization algorithms, such as:
  - Linear Programming
  - Mixed-Integer Programming
  - Genetic Algorithms
- **Problem Definition API**: An API for defining optimization problems, including objective functions and constraints.
- **Scenario Modeling**: The ability to run "what-if" scenarios with different constraints.

## Technical Design

- **Models**: `OptimizationProblem`, `Scenario`, `Solution`.
- **Services**: Service objects to encapsulate the optimization logic.
- **Integration**: Potential integration with external solvers like Gurobi or CPLEX, or open-source alternatives, likely using the [[Executor]] gem.
- **Dependencies**: [[Sidekiq]] for running complex calculations in the background, [[Kredis]] for caching results, and [[Dry-rb]] for robust business logic.
