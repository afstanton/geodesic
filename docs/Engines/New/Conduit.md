# Data Ingestion Engine

**Purpose**: To provide a robust and extensible framework for extracting, transforming, and loading data from a variety of sources into the application's data warehouse.

**Related To**: [[Vantage]], [[Catalyst]]

## Core Features

- **Source Connectors**: A pluggable architecture for connecting to various data sources, including:
  - SQL Databases (PostgreSQL, MySQL)
  - NoSQL Databases (MongoDB)
  - Third-party APIs (Salesforce, Google Analytics)
  - File uploads (CSV, Excel)
- **Credential Management**: Securely store and manage credentials for data sources.
- **ETL Job Management**:
  - Define and schedule recurring data ingestion jobs.
  - Monitor job status and logs.
  - Handle errors and retries.
- **Data Mapping**: A UI for mapping incoming data fields to the application's data model.
- **Data Validation**: Basic data validation and cleansing during the ingestion process.

## Technical Design

- **Models**: `DataSource`, `Credential`, `IngestionJob`, `FieldMapping`.
- **Controllers**: Admin-facing controllers for managing data sources and jobs.
- **Jobs**: Background jobs (using [[Sidekiq]]) to perform the ETL work.
- **Dependencies**: `Faraday` for API connections, `Sidekiq` for background processing, and the [[ETL]] gem for core processing logic.
