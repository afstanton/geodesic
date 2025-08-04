# Development Roadmap

**Purpose**: To outline the phased development plan for the Business Intelligence SaaS, from initial foundation to MVP and beyond. This roadmap provides a critical path to achieving the project's [[Interim Goals]].

## Phase 0: Foundation (Months 1-2)

**Goal**: To establish the core application shell and the absolute minimum set of components for a developer to begin working on features. This phase focuses on setting up the foundational architecture and essential services.

-   **Application Shell**: Create a new Rails application that will serve as the host for all engines. This includes basic configuration, database setup (PostgreSQL), and integration with [[Sidekiq]] for background jobs.
-   **Engine Skeletons**: Generate the skeletons for all new engines ([[Conduit]], [[Quant]], [[Canvas]], [[Sentinel]], [[Aegis]], [[Optimus]], [[Nexus]], [[Synapse]]) to establish their directory structure and basic dependencies. This ensures a modular foundation from the start.
-   **[[Aegis]] (v0.1 - Core Authentication)**: Implement basic user authentication (sign-up, login/logout) using [[Devise]]. Focus on secure user management. No complex roles or permissions yet, just user identity.
-   **[[Conduit]] (v0.1 - Basic Data Source)**: Implement the ability to connect to a single, simple data source (e.g., a PostgreSQL database or a CSV file upload). Initial focus is on data ingestion logic using [[ETL]] gem. No UI for credentials yet; they can be stored in environment variables for development.
-   **Core UI**: A very basic, unstyled UI to allow navigation between the different engine frontends. This will be a simple Rails application layout with placeholders for engine-specific views.
-   **Payment Setup**: Integrate the [[Pay]] engine with [[Stripe]] for subscription management and payment processing. This is critical for enabling revenue generation from day one.
-   **Monitoring Setup**: Integrate [[Sentry]] for error tracking and basic performance monitoring from day one.

## Phase 1: MVP Core (Months 2-4)

**Goal**: To build the minimum set of features required to provide immediate value to the first paying customer. This phase focuses on core BI functionality.

-   **[[Canvas]] (v0.5 - Basic Dashboard)**: Implement a basic interactive dashboard with the ability to display a single type of chart (e.g., line chart) using data from [[Conduit]]. Leverage [[Chartkick]] for quick visualization. Focus on a clean, intuitive display.
-   **[[Quant]] (v0.5 - Core Statistical Analysis)**: Implement one or two core statistical analyses (e.g., simple linear regression, basic time series forecasting) that can be applied to data ingested via [[Conduit]] and visualized in [[Canvas]]. Utilize [[Executor]] for R/Python integration if needed for these specific models.
-   **[[Conduit]] (v0.5 - UI & Scheduling)**: Add a user interface for managing data source credentials (securely, perhaps using Rails encrypted credentials) and scheduling recurring data ingestion jobs. This makes the data pipeline self-service.
-   **[[Aegis]] (v0.5 - Basic RBAC)**: Implement basic role-based access control (e.g., 'admin' vs. 'viewer' roles) using [[Pundit]] and [[Rolify]]. This allows for differentiated access to dashboards and data.
-   **Data Model Refinement**: Continuously refine the core data models within [[Conduit]], [[Quant]], and [[Canvas]] to support the MVP features.
-   **Testing**: Implement comprehensive [[Testing Strategy#Unit Tests]] and [[Testing Strategy#Integration Tests]] for all new features, leveraging [[RSpec]], [[FactoryBot]], [[Webmock]], and [[VCR]].

## Phase 2: Post-MVP Enhancement (Months 5-6)

**Goal**: To add features that will increase the value of the product, improve user experience, and attract a wider range of customers.

-   **[[Sentinel]] (v1.0 - Functional Alerting)**: Implement a functional alerting system that allows users to define rules based on data thresholds or anomalies detected by [[Quant]], and send notifications via email using [[Noticed]].
-   **[[Optimus]] (v1.0 - Initial Optimization)**: Implement one or two core optimization algorithms (e.g., simple resource allocation, basic supply chain optimization) that showcase the product's unique capabilities, leveraging [[Executor]] for external solvers.
-   **[[Canvas]] (v1.0 - Advanced Visualizations)**: Add more chart types, interactive features (drill-downs, filters), and customization options to the dashboards. Explore using [[Draper]] for presentation logic and [[Searchkick]] for data exploration within dashboards.
-   **[[Conduit]] (v1.0 - Expanded Data Sources)**: Add support for more diverse data sources (e.g., Salesforce, Google Analytics, custom APIs) using the [[Connector]] gem.
-   **Performance Optimization**: Utilize [[PgHero]] for database monitoring and [[Kredis]] for caching frequently accessed data or analytical results to improve application responsiveness.

## Phase 3: Advanced Capabilities (Months 7-9+)

**Goal**: To expand the platform into a more comprehensive data and AI solution, enabling platform growth and deeper integrations.

-   **[[Nexus]] (v1.0 - API Gateway)**: Develop the API Gateway to expose core BI functionalities via a secure, versioned API. Implement rate limiting with [[Rack-Attack]] and OAuth2 authentication with [[Doorkeeper]]. This opens the platform for third-party integrations.
-   **[[Synapse]] (v1.0 - MCP Gateway)**: Implement the MCP Gateway to integrate with external Machine Learning/AI platforms. Focus on enabling natural language queries or advanced predictive models by leveraging [[RubyLLM]], [[RubyLLM-MCP]], and [[RubyLLM-Schema]]. This will allow the BI tool to offer AI-driven insights.
-   **Vertical Specialization**: Begin building industry-specific features within existing engines, informed by market research, to target specific verticals (e.g., healthcare, financial services).
-   **Scalability & Reliability**: Continuously refine deployment strategies, monitoring, and infrastructure to support a growing user base and data volume. This includes leveraging more advanced AWS services like ECS/EKS as needed.

