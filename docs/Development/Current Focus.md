# Current Focus - Sprint 1 (Weeks 1-2)

**Last Updated:** August 2025  
**Sprint Goal:** Multi-tenant architecture with basic statistical capabilities  
**Critical Path:** Foundation → MVP → First Customer

## This Week's Priorities

### 🔴 PRIORITY 1: Multi-Tenant Foundation (Days 1-2)
**Owner:** Aaron  
**Status:** In Progress

- [ ] Install and configure acts_as_tenant gem
- [ ] Create Tenant model with API key generation
- [ ] Add tenant_id to all data models
- [ ] Build tenant switching middleware
- [ ] Write comprehensive isolation tests
- [ ] Document tenant architecture decisions

**Success Criteria:** Can create tenants with isolated data, zero cross-tenant leakage

### 🟡 PRIORITY 2: Quant Engine MVP (Days 3-4)
**Owner:** Aaron  
**Status:** Not Started

- [ ] Linear regression with confidence intervals
- [ ] A/B testing with proper statistical inference  
- [ ] Time series forecasting (basic ARIMA)
- [ ] API endpoints for all functions
- [ ] Comprehensive accuracy tests

**Success Criteria:** API returns statistically valid results with confidence intervals

### 🟢 PRIORITY 3: Security Foundation (Day 5)
**Owner:** Aaron  
**Status:** Not Started  

- [ ] Devise authentication setup
- [ ] JWT for API authentication
- [ ] Audit logging system
- [ ] Basic RBAC with Pundit
- [ ] Tenant-specific encryption keys

**Success Criteria:** All API calls authenticated, all data access logged

## Blocked Items

None currently.

## Decisions Needed This Week

1. **Statistics Library**: Build custom vs use statsample gem?
   - **Recommendation:** Start with custom for control, migrate if needed
   
2. **Tenant Isolation**: Confirmed using acts_as_tenant
   - **Decision Made:** Row-level isolation with acts_as_tenant gem
   
3. **Background Jobs**: Sidekiq vs GoodJob?
   - **Recommendation:** Sidekiq for ecosystem and stability

## Daily Checklist

### Monday
- [ ] Morning: Install acts_as_tenant and create tenant model
- [ ] Afternoon: Add tenant_id to all models and migrations
- [ ] Evening: Write first isolation test

### Tuesday  
- [ ] Morning: Complete tenant middleware
- [ ] Afternoon: Full isolation test suite
- [ ] Evening: Document architecture decisions

### Wednesday
- [ ] Morning: Quant engine structure
- [ ] Afternoon: Linear regression implementation
- [ ] Evening: Regression API endpoint

### Thursday
- [ ] Morning: A/B testing implementation
- [ ] Afternoon: Time series basics
- [ ] Evening: API endpoints and tests

### Friday
- [ ] Morning: Authentication setup
- [ ] Afternoon: Audit logging
- [ ] Evening: Sprint retrospective and planning

## Definition of Done

- [ ] Code written and working
- [ ] Tests written and passing
- [ ] Documentation updated
- [ ] Committed to git
- [ ] No security vulnerabilities
- [ ] Performance acceptable (<500ms)

## Sprint Metrics

| Metric | Target | Current |
|--------|--------|---------|
| Features Complete | 3 | 0 |
| Test Coverage | >80% | ~5% |
| API Endpoints | 5 | 0 |
| Documentation | Updated | Partial |

## Notes

- Focus on getting multi-tenancy right - it's the foundation
- Don't over-engineer the statistics initially - iterate
- Security can't be an afterthought - build it in now
- Keep the API simple and well-documented

## Next Sprint Preview

**Sprint 2 (Weeks 3-4):** Data Pipeline  
- Conduit engine for data ingestion
- Canvas basics for visualization
- CI/CD pipeline setup
- Integration testing

---

*Review this document each morning. Update status each evening.*
