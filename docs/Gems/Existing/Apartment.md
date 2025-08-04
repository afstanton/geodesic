# Apartment

**URL:** https://github.com/influitive/apartment

**Description:**
Database multi-tenancy for Rails applications using PostgreSQL schemas. Provides complete isolation between tenants while sharing the same database instance. Essential for SaaS applications that need to separate customer data securely.

**Relevance to Geodesic Projects:**
- **Business Intelligence SaaS:** Critical for separating customer data and analytics in multi-tenant environment
- **Marketing Analytics SaaS:** Essential for isolating marketing data between different customer accounts
- **SaaS Factory Strategy:** Core multi-tenancy component for all SaaS applications

**Key Features:**
- Schema-based multi-tenancy
- Automatic tenant switching
- Migration management per tenant
- Background job tenant awareness
- Subdomain and domain-based switching
- Tenant data isolation
- Easy setup and configuration
- Performance optimizations

**Integration Considerations:**
- PostgreSQL specific (uses schemas)
- Excellent for data isolation requirements
- Works well with background job processing
- Good performance characteristics
- Essential for enterprise SaaS applications
- Handles complex tenant scenarios
- Well-documented migration strategies
