# Existing Ruby Gems for Geodesic Projects

This directory contains documentation for Ruby gems that would accelerate development of the Business Intelligence and Marketing Analytics SaaS applications.

## Core Infrastructure Gems

### Authentication & Authorization
- **[[Pundit]]** - Policy-based authorization with explicit permission definitions

### Multi-tenancy & Data Management
- **[[Apartment]]** - PostgreSQL schema-based multi-tenancy for data isolation
- **[[Scenic]]** - Database views with versioning for complex analytics queries

### Background Processing
- **[[Sidekiq]]** - High-performance Redis-based background job processing

## Analytics & Visualization Gems

### Data Processing
- **[[Groupdate]]** - Time-series grouping for analytics and reporting
- **[[ETL]]** - Extract, Transform, Load framework for data pipelines
- **[[Dry-rb]]** - Functional programming libraries for robust business logic

### Visualization & UI
- **[[Chartkick]]** - Simple, powerful charts using Chart.js, Google Charts, or Highcharts
- **[[Draper]]** - Adds a presentation layer to your Rails app.
- **[[Kaminari]]** - Clean, customizable pagination for large datasets
- **[[Ransack]]** - Advanced search and filtering for data-heavy applications
- **[[Blazer]]** - Business intelligence and SQL-based reporting interface

## Infrastructure & Performance Gems

### API Integration
- **[[Faraday]]** - HTTP client library for robust API integrations

### Caching & Performance
- **[[Kredis]]** - Higher-level Redis data structures for caching and real-time features
- **[[PgHero]]** - PostgreSQL performance monitoring and optimization

## Testing Gems

- **[[RSpec]]** - Behavior-driven development framework for Ruby.
- **[[FactoryBot]]** - A library for building test data.
- **[[RSpec Mocks]]** - A test double framework for RSpec.
- **[[Webmock]]** - A library for stubbing and setting expectations on HTTP requests.
- **[[VCR]]** - A library for recording and replaying HTTP interactions during tests.

## SaaS Application Gems

### Payment & Billing
- **[[Stripe]]** - Official Stripe integration for subscription billing and payments

### User Engagement
- **[[Noticed]]** - Multi-channel notification system for alerts and communications
- **[[Ahoy]]** - First-party analytics tracking for user behavior and events

## Selection Criteria

When choosing gems for integration:

1. **Active Maintenance** - Regular updates and security patches
2. **Community Support** - Good documentation and community resources
3. **Performance** - Minimal impact on application performance
4. **Rails Integration** - Seamless integration with Rails conventions
5. **Testing Support** - Good test helpers and documentation
6. **Scalability** - Performs well as application grows
7. **License** - Compatible with commercial SaaS use

## Integration Strategy

Gems provide focused functionality that can be:

- **Shared across applications** - Universal components like authentication, billing
- **Application-specific** - Specialized analytics or visualization needs
- **Environment-dependent** - Different gems for development, testing, production

The modular approach allows selective integration based on specific application requirements while maintaining consistency across the SaaS Factory ecosystem.

## Recommended Combinations

### Business Intelligence SaaS Stack
**Core Infrastructure:**
- [[Devise]] (Engine) + [[Pundit]] - Authentication and granular authorization
- [[Apartment]] - Multi-tenant data isolation
- [[Sidekiq]] - Background processing for ETL operations
- [[Dry-rb]] - Robust business logic and validation

**Analytics & Visualization:**
- [[Scenic]] - Materialized views for performance
- [[Chartkick]] + [[Groupdate]] - Time-series visualization
- [[Kaminari]] + [[Ransack]] - Data browsing and filtering
- [[Blazer]] - Self-service SQL reporting interface

**Performance & Integration:**
- [[PgHero]] - Database performance monitoring
- [[Kredis]] - Caching for real-time dashboard updates
- [[Faraday]] - External data source integrations

**SaaS Operations:**
- [[Stripe]] - Subscription billing
- [[Noticed]] - Alert and notification system
- [[Ahoy]] - Usage analytics

### Marketing Analytics SaaS Stack
**Core Infrastructure:**
- [[Devise]] (Engine) + [[Pundit]] - Authentication and role-based access
- [[Apartment]] - Customer data isolation
- [[Sidekiq]] - High-performance data processing
- [[Dry-rb]] - Reliable attribution calculations

**Data Processing:**
- [[ETL]] - Marketing data pipeline processing
- [[Scenic]] - Attribution and performance views
- [[Groupdate]] - Time-based marketing analytics
- [[Faraday]] - Marketing platform API integrations

**Analytics & Reporting:**
- [[Chartkick]] - Marketing performance visualization
- [[Ransack]] - Campaign and channel filtering
- [[Kaminari]] - Large dataset pagination
- [[Blazer]] - Advanced analytics interface

**Performance & Caching:**
- [[Kredis]] - Real-time campaign data caching
- [[PgHero]] - Query optimization for large datasets

**SaaS Operations:**
- [[Stripe]] - Subscription management
- [[Noticed]] - Campaign alerts and notifications
- [[Ahoy]] - User interaction tracking
