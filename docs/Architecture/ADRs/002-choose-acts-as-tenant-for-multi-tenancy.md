# ADR 002: Choose `acts_as_tenant` for Multi-Tenancy

## Status
Accepted

## Context

The Geodesic project, particularly the [[Apex Analytics Platform]], requires robust multi-tenancy to ensure data isolation and scalability for its white-label SaaS offerings. Initially, the [[Development Roadmap]] referenced the `Apartment` gem for schema-based multi-tenancy.

However, the `Apartment` gem has not been actively maintained for several years (last update 6+ years ago). Using an outdated gem for such a critical architectural component introduces significant risks:

-   **Security Vulnerabilities:** Potential unpatched security flaws.
-   **Compatibility Issues:** Likely incompatibility with modern Rails versions (e.g., Rails 8.0.2).
-   **Lack of Support:** No ongoing bug fixes, new features, or community support.
-   **Technical Debt:** Increased maintenance burden and difficulty with future upgrades.

## Decision

To adopt `acts_as_tenant` for implementing row-level multi-tenancy across the Geodesic project.

## Alternatives Considered

-   **Continue with `Apartment`:** Rejected due to the risks associated with an unmaintained gem.
-   **Implement custom row-level multi-tenancy:** Rejected to avoid reinventing the wheel and to leverage a well-tested, community-supported solution.

## Rationale

-   **Active Maintenance:** `acts_as_tenant` is a widely used and actively maintained gem, ensuring ongoing compatibility with Rails and security updates.
-   **Row-Level Multi-Tenancy:** This approach offers several advantages over schema-based multi-tenancy for a SaaS platform:
    -   **Simpler Migrations:** Database migrations are applied once across all tenants, simplifying development and deployment.
    -   **Improved Scalability:** Often more performant for a large number of tenants as it avoids the overhead of managing numerous database schemas.
    -   **Flexible Data Sharing:** While strict isolation is the default, it allows for more flexible data sharing patterns if needed in the future (e.g., shared lookup tables).
-   **Clear API:** Provides a clean and intuitive API for scoping data to the current tenant, making application development straightforward.
-   **Community Support:** A large community and extensive documentation are available.

## Consequences

-   All models requiring tenant scoping will need to include `acts_as_tenant :tenant`.
-   Application code will need to ensure the `current_tenant` is correctly set in controllers and background jobs.
-   The `users` table (managed by [[Aegis]]) will require a `tenant_id` column.
-   The `Aegis` engine will be responsible for setting and managing the `current_tenant` context during authentication and subsequent requests.
