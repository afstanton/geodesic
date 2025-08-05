# Current Focus

*This document should be updated weekly to reflect immediate priorities.*

---

**Date:** 2025-08-05

## This Week's Goal
Implement foundational user authentication and tenant scoping for the [[Vantage]] application, leveraging the [[Aegis]] engine.

## Key Tasks
- [ ] Initialize Devise for the User model in the Vantage app.
- [ ] Configure Devise to work with multi-tenancy using the Apartment gem.
- [ ] Create initial RBAC roles (Admin, User) using Rolify within the Aegis engine.
- [ ] Build the first controller action that is properly scoped to the current user's tenant.
- [ ] Write a basic integration test to confirm a user from one tenant cannot see data from another.

## Blockers
- [ ] None at this time.
