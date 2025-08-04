# Data Model

**Purpose**: To define the high-level data model for the Business Intelligence SaaS, ensuring consistency across the different engines.

## Entity-Relationship Diagram (ERD)

*This section will be populated with a visual ERD once the core models are more clearly defined.*

## Core Models

This section defines the key models that are shared or have significant relationships across different engines.

### User (from [[Security Engine]])

- **`id`**: Primary key
- **`email`**: String
- **`encrypted_password`**: String
- **`role_id`**: Foreign key to `Role`

### Role (from [[Security Engine]])

- **`id`**: Primary key
- **`name`**: String (e.g., "admin", "user")

### DataSource (from [[Data Ingestion Engine]])

- **`id`**: Primary key
- **`name`**: String
- **`source_type`**: String (e.g., "postgresql", "salesforce")
- **`credentials`**: Encrypted text
- **`user_id`**: Foreign key to `User`

### Dashboard (from [[Visualization Engine]])

- **`id`**: Primary key
- **`name`**: String
- **`user_id`**: Foreign key to `User`

### Widget (from [[Visualization Engine]])

- **`id`**: Primary key
- **`dashboard_id`**: Foreign key to `Dashboard`
- **`chart_type`**: String (e.g., "line", "bar")
- **`query`**: Text

### Alert (from [[Alerting Engine]])

- **`id`**: Primary key
- **`name`**: String
- **`widget_id`**: Foreign key to `Widget`
- **`threshold`**: Float
- **`user_id`**: Foreign key to `User`
