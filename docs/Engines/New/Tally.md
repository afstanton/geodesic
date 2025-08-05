# Tally Engine

**Purpose:** To provide a reusable, robust, and extensible engine for metering and calculating usage-based billing for any application in the [[SaaS Factory Model]].

**Related To:** [[Apex Analytics Platform]], [[Nexus]], [[Conduit]], [[Pay]]

---

## Strategic Importance

The Tally engine abstracts the complex logic of usage-based billing into a standalone component. This prevents application-specific implementations and ensures that sophisticated metering and pricing models can be easily reused across multiple products. It is the practical implementation of the **[[Transparent Pricing Model]]** advantage.

## Core Features & Responsibilities

### 1. Metric Definition
- Provides a configurable interface for an application to register its specific billable metrics (e.g., `:api_calls`, `:data_processed_gb`, `:user_sessions`).
- Allows defining the type of metric (e.g., counter, gauge) for proper aggregation.

### 2. Usage Ingestion API
- A simple, high-throughput internal API endpoint for other engines to report usage events in real-time.
- **Example:** `Tally.record(tenant: current_tenant, metric: :api_calls, value: 1)`

### 3. Usage Aggregation Service
- Runs efficient background jobs (using [[Sidekiq]]) to aggregate raw usage events into billable totals per tenant.
- Supports configurable aggregation windows (e.g., hourly, daily) to ensure performance and scalability.

### 4. Entitlements & Pricing Logic
- Integrates with a subscription management engine like [[Pay]] to understand each tenant's plan.
- Fetches the tenant's included quotas (e.g., 100,000 free API calls).
- Fetches the specific overage rates for each metric defined in the plan.

### 5. Billing Calculation Service
- At the end of a billing cycle, calculates the final, usage-based invoice amount.
- Determines the quantity of overages for each metric by comparing aggregated usage against the tenant's entitlements.
- Generates a detailed, auditable breakdown of the charges for full transparency.

### 6. Payment Gateway Integration
- Acts as the "calculator" that hands off the final, authoritative amount to the payment processing engine ([[Pay]]).
- [[Pay]] remains the system responsible for the financial transaction with Stripe, keeping Tally out of direct PCI scope.

## Technical Design

- **Models:** `BillableMetric`, `UsageEvent`, `AggregatedUsage`, `TenantEntitlement`.
- **API:** A simple internal REST or GraphQL API for event ingestion.
- **Background Jobs:** Leverages [[Sidekiq]] for the aggregation service.
- **Dependencies:** [[Pay]] (or another subscription management gem), [[Sidekiq]], [[Kredis]] (for high-speed counters).

## Implementation Priority

- **v0.1 (Foundation):** Basic event ingestion and daily aggregation for 1-2 core metrics.
- **v0.5 (Billing Integration):** Integration with [[Pay]] to calculate overages and generate a draft invoice.
- **v1.0 (Full Service):** Configurable metrics, real-time usage dashboard hooks, and full billing cycle automation.
