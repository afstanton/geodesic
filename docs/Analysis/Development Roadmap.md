# Development Roadmap

**Purpose**: To outline the phased development plan for the Business Intelligence SaaS, from initial foundation to MVP and beyond. This roadmap provides a critical path to achieving the project's [[Interim Goals]].

## Phase 0: Foundation (Months 1-2)

**Goal**: To establish the core application shell and the absolute minimum set of components for a developer to begin working on features.

- **Application Shell**: Create a new Rails application that will serve as the host for the engines.
- **Engine Skeletons**: Generate the skeletons for all the new engines to establish the directory structure and basic dependencies.
- **[[Aegis]] (v0.1)**: Implement basic user authentication (login/logout) using [[Devise]]. No roles or permissions yet.
- **[[Conduit]] (v0.1)**: Implement the ability to connect to a single, simple data source (e.g., a PostgreSQL database). No UI for credentials yet; they can be stored in environment variables.
- **Core UI**: A very basic, unstyled UI to allow navigation between the different engine frontends.

## Phase 1: MVP Core (Months 2-4)

**Goal**: To build the minimum set of features required to provide value to the first paying customer.

- **[[Canvas]] (v0.5)**: Implement a basic dashboard with the ability to display a single chart. Use [[Chartkick]] for the initial implementation.
- **[[Quant]] (v0.5)**: Implement one or two core statistical analyses (e.g., linear regression, time series forecasting).
- **[[Conduit]] (v0.5)**: Add a UI for managing data source credentials and scheduling ingestion jobs.
- **[[Aegis]] (v0.5)**: Implement basic role-based access control (e.g., admin, user).

## Phase 2: Post-MVP Enhancement (Months 5-6)

**Goal**: To add features that will increase the value of the product and attract a wider range of customers.

- **[[Sentinel]] (v1.0)**: A functional alerting system that can send email notifications based on data thresholds.
- **[[Optimus]] (v1.0)**: Implement one or two optimization algorithms to showcase the product's unique capabilities.
- **[[Canvas]] (v1.0)**: Add more chart types and interactive features to the dashboards.
- **[[Conduit]] (v1.0)**: Add support for more data sources (e.g., Salesforce, Google Analytics).
