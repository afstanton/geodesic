# Testing Checklist - Apex Analytics Platform

**Coverage Target:** >80% for all critical paths  
**Performance Target:** <500ms API response time  
**Security Target:** Zero cross-tenant data leakage

## Unit Testing Checklist

### Tenant Model Tests
```ruby
# spec/models/tenant_spec.rb
```
- [ ] Creates tenant with unique subdomain
- [ ] Generates unique API key on creation
- [ ] Creates PostgreSQL schema on creation
- [ ] Prevents duplicate subdomains
- [ ] Prevents duplicate API keys
- [ ] Cascades deletion properly
- [ ] Validates required fields
- [ ] Encrypts sensitive data

### Quant Engine Tests
```ruby
# gems/quant/spec/regression_spec.rb
```
- [ ] Linear regression returns correct coefficients
- [ ] Confidence intervals are mathematically correct
- [ ] R-squared calculation is accurate
- [ ] Handles edge cases (single point, perfect correlation)
- [ ] Handles nil/missing values gracefully
- [ ] Performance test with 10,000 points
- [ ] Validates input data types
- [ ] Returns proper error messages

### Statistical Accuracy Tests
```ruby
# gems/quant/spec/statistical_accuracy_spec.rb
```
- [ ] Compare against R results
- [ ] Compare against Python scipy
- [ ] Verify p-values are correct
- [ ] Test confidence interval coverage
- [ ] Validate hypothesis test results
- [ ] Check time series forecasts
- [ ] Ensure reproducible results
- [ ] Test with known datasets

## Integration Testing Checklist

### Multi-Tenant Isolation Tests
```ruby
# spec/integration/multi_tenant_spec.rb
```
- [ ] Data created in tenant A not visible in tenant B
- [ ] API calls with tenant A key cannot access tenant B
- [ ] Database queries scoped to correct schema
- [ ] Background jobs process in correct tenant context
- [ ] Cache keys include tenant identifier
- [ ] File uploads isolated per tenant
- [ ] Audit logs record correct tenant
- [ ] No data leakage in error messages

### API Endpoint Tests
```ruby
# spec/requests/api/v1/analysis_spec.rb
```
- [ ] POST /analysis/regression requires authentication
- [ ] Returns 401 without valid API key
- [ ] Returns 403 for suspended tenants
- [ ] Returns 422 for invalid input data
- [ ] Returns 200 with correct JSON structure
- [ ] Includes confidence intervals in response
- [ ] Rate limiting works per tenant
- [ ] Audit logs API calls

### Data Pipeline Tests
```ruby
# spec/integration/data_pipeline_spec.rb  
```
- [ ] CSV upload processes correctly
- [ ] Large files (>100MB) handled
- [ ] Malformed CSV rejected gracefully
- [ ] Data encrypted immediately on upload
- [ ] Processing job queued successfully
- [ ] Results stored in correct tenant schema
- [ ] Temporary files cleaned up
- [ ] Upload progress tracked accurately

## Security Testing Checklist

### Authentication Tests
- [ ] JWT tokens expire correctly
- [ ] Refresh tokens work properly
- [ ] Invalid tokens rejected
- [ ] Token replay attacks prevented
- [ ] Brute force protection active
- [ ] Password complexity enforced
- [ ] 2FA implementation works
- [ ] Session timeout functions

### Authorization Tests
- [ ] RBAC policies enforced
- [ ] Admin cannot access other tenants
- [ ] Users see only permitted resources
- [ ] API endpoints check permissions
- [ ] Direct object reference prevented
- [ ] Privilege escalation blocked
- [ ] Default deny policy works
- [ ] Audit trail complete

### Encryption Tests
- [ ] Data encrypted at rest
- [ ] Data encrypted in transit (TLS)
- [ ] Tenant-specific keys used
- [ ] Key rotation works properly
- [ ] Encrypted fields not searchable
- [ ] Backups encrypted
- [ ] Logs sanitized of sensitive data
- [ ] Memory cleared after use

## Performance Testing Checklist

### Load Tests
```bash
# Using Apache Bench or k6
```
- [ ] 100 concurrent users
- [ ] 1,000 requests per second
- [ ] Response time <500ms at p95
- [ ] No memory leaks over 1 hour
- [ ] Database connection pool stable
- [ ] Redis cache hit rate >80%
- [ ] CDN serving static assets
- [ ] Auto-scaling triggers work

### Stress Tests
- [ ] System recovers from database outage
- [ ] Handles Redis cache failure
- [ ] Queue backup doesn't crash system
- [ ] Memory limits enforced
- [ ] CPU throttling works
- [ ] Disk space monitoring alerts
- [ ] Network partition handling
- [ ] Cascading failure prevention

### Statistical Performance
- [ ] Regression on 10,000 points <1s
- [ ] A/B test on 100,000 samples <2s
- [ ] Time series forecast 365 days <3s
- [ ] Correlation matrix 100x100 <5s
- [ ] Background processing for >5s tasks
- [ ] Progress indicators for long tasks
- [ ] Caching of repeated calculations
- [ ] Incremental computation where possible

## User Experience Testing

### API Developer Experience
- [ ] API documentation accurate
- [ ] Code examples work
- [ ] Error messages helpful
- [ ] SDK easy to integrate
- [ ] Sandbox environment works
- [ ] Rate limit headers clear
- [ ] Versioning documented
- [ ] Breaking changes communicated

### Vantage UI Tests
- [ ] Dashboard loads <2 seconds
- [ ] Charts render correctly
- [ ] Responsive on mobile
- [ ] Accessibility standards met
- [ ] Error states handled gracefully
- [ ] Loading states shown
- [ ] Empty states helpful
- [ ] Forms validate properly

### White-Label Integration
- [ ] SDK embeds without conflicts
- [ ] Styling customizable
- [ ] Events fire correctly
- [ ] Real-time updates work
- [ ] Fallback for old browsers
- [ ] CSP headers compatible
- [ ] CORS configured properly
- [ ] Documentation complete

## Deployment Testing

### Pre-Production Checklist
- [ ] All tests passing
- [ ] Security scan clean
- [ ] Dependencies up-to-date
- [ ] Environment variables set
- [ ] Database migrations tested
- [ ] Rollback plan ready
- [ ] Monitoring configured
- [ ] Alerts set up

### Smoke Tests (Post-Deploy)
```bash
# scripts/smoke_test.sh
```
- [ ] Health check endpoint responds
- [ ] Database connection works
- [ ] Redis cache accessible
- [ ] API authentication works
- [ ] Statistical calculation runs
- [ ] File upload processes
- [ ] Background jobs running
- [ ] Monitoring data flowing

### Rollback Tests
- [ ] Can rollback in <5 minutes
- [ ] Database migrations reversible
- [ ] Previous version cache cleared
- [ ] DNS changes revertable
- [ ] Customer data preserved
- [ ] Audit trail maintained
- [ ] No data loss occurs
- [ ] Customer notification ready

## Compliance Testing

### GDPR Compliance
- [ ] Right to deletion works
- [ ] Data export available
- [ ] Consent tracking implemented
- [ ] Privacy policy updated
- [ ] Data minimization practiced
- [ ] Purpose limitation enforced
- [ ] Data retention policies work
- [ ] Breach notification ready

### SOC 2 Requirements
- [ ] Access controls verified
- [ ] Encryption confirmed
- [ ] Monitoring active
- [ ] Incident response tested
- [ ] Change management documented
- [ ] Risk assessment complete
- [ ] Vendor management tracked
- [ ] Training records maintained

## Testing Automation

### CI Pipeline Tests
```yaml
# .github/workflows/test.yml
```
- [ ] Unit tests run on every commit
- [ ] Integration tests on PR
- [ ] Security scan weekly
- [ ] Performance test nightly
- [ ] Coverage report generated
- [ ] Failed tests block merge
- [ ] Notifications configured
- [ ] Artifacts preserved

### Test Data Management
- [ ] Fixtures maintained
- [ ] Factories up-to-date
- [ ] Seeds create valid state
- [ ] Test database isolated
- [ ] Sensitive data masked
- [ ] Cleanup runs properly
- [ ] Reproducible datasets
- [ ] Performance test data realistic

## Manual Testing Scenarios

### Customer Journey Tests
1. **New Customer Onboarding**
   - [ ] Sign up with valid data
   - [ ] Receive welcome email
   - [ ] Complete setup wizard
   - [ ] Upload first dataset
   - [ ] Run first analysis
   - [ ] View results
   - [ ] Export report
   - [ ] Invite team member

2. **Daily Usage**
   - [ ] Login with credentials
   - [ ] View dashboard
   - [ ] Upload new data
   - [ ] Run regression analysis
   - [ ] Create visualization
   - [ ] Share with team
   - [ ] Schedule report
   - [ ] Check usage metrics

3. **Problem Scenarios**
   - [ ] Upload corrupted file
   - [ ] Exceed rate limits
   - [ ] Forgot password flow
   - [ ] Payment failure
   - [ ] API key compromise
   - [ ] Data deletion request
   - [ ] Account suspension
   - [ ] Support ticket flow

## Bug Tracking

### Critical Bugs (Fix Immediately)
- [ ] Security vulnerability
- [ ] Data loss possibility
- [ ] Cross-tenant leakage
- [ ] Payment processing error
- [ ] Complete feature failure

### Major Bugs (Fix This Sprint)
- [ ] Incorrect calculations
- [ ] Performance degradation
- [ ] UI breaking errors
- [ ] API inconsistencies
- [ ] Data corruption risk

### Minor Bugs (Fix Next Sprint)
- [ ] UI inconsistencies
- [ ] Missing validations
- [ ] Unclear error messages
- [ ] Documentation errors
- [ ] Edge case failures

## Testing Resources

### Tools
- **RSpec** - Unit and integration tests
- **Capybara** - Browser testing
- **VCR** - HTTP interaction recording
- **FactoryBot** - Test data generation
- **SimpleCov** - Code coverage
- **Brakeman** - Security scanning
- **Bullet** - N+1 query detection
- **Apache Bench** - Load testing

### Test Databases
- `geodesic_test` - Unit tests
- `geodesic_integration` - Integration tests
- `geodesic_performance` - Performance tests

### Monitoring
- Sentry for error tracking
- New Relic for performance
- Datadog for infrastructure
- PagerDuty for alerts

---

*Run through this checklist before every release. No exceptions.*
