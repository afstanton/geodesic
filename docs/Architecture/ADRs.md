# Architecture Decision Records (ADRs)

**Purpose**: To document significant architectural decisions made during the Geodesic project. Each ADR captures the context, the decision made, and its consequences, providing a historical log of the project's architectural evolution.

## ADR 001: Authorization Gem Standardization

- **Status**: Accepted
- **Context**: The project initially considered both [[Pundit]] and CanCanCan for authorization. To maintain consistency and reduce complexity across the [[SaaS Factory Strategy]], a single authorization gem needed to be chosen.
- **Decision**: Standardize on [[Pundit]] for authorization.
- **Consequences**:
    - **Pros**: Pundit's policy-based approach promotes explicit and testable authorization logic, which is beneficial for complex, multi-tenant SaaS applications. It integrates well with [[Rolify]] for role management.
    - **Cons**: Requires more boilerplate code compared to CanCanCan's DSL. CanCanCan was removed from the recommended gems.

## ADR 002: Background Job Processor Standardization

- **Status**: Accepted
- **Context**: The project initially considered both [[Sidekiq]] (Redis-based) and Good Job (PostgreSQL-based) for background job processing. To simplify infrastructure and reduce operational overhead, a single solution needed to be chosen.
- **Decision**: Standardize on [[Sidekiq]] for background job processing.
- **Consequences**:
    - **Pros**: Sidekiq is a high-performance, industry-standard solution for background jobs in Ruby, well-suited for data-intensive ETL and analytical tasks. It has a mature ecosystem and robust monitoring tools.
    - **Cons**: Requires managing a separate Redis instance, adding a dependency beyond PostgreSQL. Good Job was removed from the recommended gems.

## ADR 003: Data Ingestion Engine Leveraging ETL Gem

- **Status**: Accepted
- **Context**: The [[Conduit]] is a new, high-level component responsible for managing the entire data ingestion process. The existing [[ETL]] gem provides a low-level framework for ETL processes.
- **Decision**: The [[Conduit]] will leverage the [[ETL]] gem as an internal dependency for its core processing logic.
- **Consequences**:
    - **Pros**: Promotes code reuse and leverages an existing, battle-tested gem for the fundamental ETL operations. Reduces the development effort for the Data Ingestion Engine.
    - **Cons**: Introduces a dependency on the ETL gem, requiring familiarity with its API and conventions.
