# Quick Start Guide - Apex Analytics Platform

**Goal:** Get from zero to working MVP as fast as possible  
**Time Frame:** 2 weeks for foundation, 6 weeks for MVP  
**Focus:** Multi-tenant platform with statistical differentiation

## Day 1: Multi-Tenant Foundation (4 hours)

### Step 1: Set Up Database Schema Isolation
```bash
cd code/ruby/apps/apex
```

#### Create Tenant Model
```ruby
# app/models/tenant.rb
class Tenant < ApplicationRecord
  validates :name, :subdomain, :api_key, presence: true
  validates :subdomain, :api_key, uniqueness: true
  
  before_create :generate_api_key
  after_create :create_schema
  
  private
  
  def generate_api_key
    self.api_key = SecureRandom.hex(32)
  end
  
  def create_schema
    ActiveRecord::Base.connection.execute("CREATE SCHEMA IF NOT EXISTS tenant_#{id}")
  end
end
```

#### Create Migration
```bash
rails g migration CreateTenants name:string subdomain:string api_key:string schema_name:string settings:jsonb
rails db:migrate
```

### Step 2: Implement Tenant Switching
```ruby
# app/middleware/tenant_switcher.rb
class TenantSwitcher
  def initialize(app)
    @app = app
  end
  
  def call(env)
    request = Rack::Request.new(env)
    tenant = find_tenant(request)
    
    if tenant
      ActiveRecord::Base.connection.execute("SET search_path TO tenant_#{tenant.id}, public")
    end
    
    @app.call(env)
  ensure
    ActiveRecord::Base.connection.execute("SET search_path TO public")
  end
  
  private
  
  def find_tenant(request)
    api_key = request.env['HTTP_API_KEY']
    Tenant.find_by(api_key: api_key) if api_key
  end
end

# config/application.rb
config.middleware.use TenantSwitcher
```

### Step 3: Test Multi-Tenancy
```ruby
# spec/models/tenant_spec.rb
RSpec.describe Tenant do
  it 'creates isolated schema' do
    tenant = Tenant.create!(name: 'Test', subdomain: 'test')
    
    # Check schema exists
    result = ActiveRecord::Base.connection.execute(
      "SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'tenant_#{tenant.id}'"
    )
    expect(result.count).to eq(1)
  end
  
  it 'isolates data between tenants' do
    tenant1 = Tenant.create!(name: 'Tenant1', subdomain: 'tenant1')
    tenant2 = Tenant.create!(name: 'Tenant2', subdomain: 'tenant2')
    
    # Create data in tenant1
    ActiveRecord::Base.connection.execute("SET search_path TO tenant_#{tenant1.id}")
    # ... create test data
    
    # Switch to tenant2 and verify no data bleeds
    ActiveRecord::Base.connection.execute("SET search_path TO tenant_#{tenant2.id}")
    # ... verify isolation
  end
end
```

## Day 2: Quant Engine MVP (4 hours)

### Step 1: Create Quant Engine Structure
```bash
cd code/ruby/gems/quant
```

### Step 2: Implement Basic Statistical Functions
```ruby
# lib/quant/regression.rb
module Quant
  class Regression
    def self.linear(x_values, y_values, confidence_level = 0.95)
      n = x_values.length
      
      # Calculate means
      x_mean = x_values.sum.to_f / n
      y_mean = y_values.sum.to_f / n
      
      # Calculate slope and intercept
      numerator = x_values.zip(y_values).map { |x, y| (x - x_mean) * (y - y_mean) }.sum
      denominator = x_values.map { |x| (x - x_mean) ** 2 }.sum
      
      slope = numerator / denominator
      intercept = y_mean - slope * x_mean
      
      # Calculate R-squared
      y_predicted = x_values.map { |x| slope * x + intercept }
      ss_res = y_values.zip(y_predicted).map { |y, yp| (y - yp) ** 2 }.sum
      ss_tot = y_values.map { |y| (y - y_mean) ** 2 }.sum
      r_squared = 1 - (ss_res / ss_tot)
      
      # Calculate confidence intervals (simplified)
      se = Math.sqrt(ss_res / (n - 2))
      t_value = 1.96 # approximation for 95% confidence
      
      slope_ci = [slope - t_value * se, slope + t_value * se]
      intercept_ci = [intercept - t_value * se, intercept + t_value * se]
      
      {
        slope: slope,
        intercept: intercept,
        r_squared: r_squared,
        confidence_intervals: {
          slope: slope_ci,
          intercept: intercept_ci
        }
      }
    end
  end
end

# lib/quant/hypothesis.rb
module Quant
  class Hypothesis
    def self.ab_test(control, treatment, confidence_level = 0.95)
      n1 = control.length
      n2 = treatment.length
      
      mean1 = control.sum.to_f / n1
      mean2 = treatment.sum.to_f / n2
      
      var1 = control.map { |x| (x - mean1) ** 2 }.sum / (n1 - 1)
      var2 = treatment.map { |x| (x - mean2) ** 2 }.sum / (n2 - 1)
      
      # Pooled standard error
      se = Math.sqrt(var1/n1 + var2/n2)
      
      # T-statistic
      t_stat = (mean2 - mean1) / se
      
      # Degrees of freedom (Welch's approximation)
      df = ((var1/n1 + var2/n2) ** 2) / 
           ((var1/n1) ** 2 / (n1-1) + (var2/n2) ** 2 / (n2-1))
      
      # P-value (simplified - would use distribution in production)
      p_value = 2 * (1 - 0.975) if t_stat.abs > 1.96
      p_value ||= 0.5
      
      {
        control_mean: mean1,
        treatment_mean: mean2,
        difference: mean2 - mean1,
        t_statistic: t_stat,
        p_value: p_value,
        significant: p_value < (1 - confidence_level),
        confidence_interval: [
          (mean2 - mean1) - 1.96 * se,
          (mean2 - mean1) + 1.96 * se
        ]
      }
    end
  end
end
```

### Step 3: Create API Endpoints
```ruby
# code/ruby/apps/apex/app/controllers/api/v1/analysis_controller.rb
module Api
  module V1
    class AnalysisController < ApplicationController
      before_action :authenticate_tenant!
      
      def regression
        result = Quant::Regression.linear(
          params[:x_values],
          params[:y_values],
          params[:confidence_level] || 0.95
        )
        
        render json: {
          data: {
            type: 'regression_analysis',
            attributes: result
          }
        }
      end
      
      def ab_test
        result = Quant::Hypothesis.ab_test(
          params[:control],
          params[:treatment],
          params[:confidence_level] || 0.95
        )
        
        render json: {
          data: {
            type: 'ab_test_analysis',
            attributes: result
          }
        }
      end
    end
  end
end

# config/routes.rb
namespace :api do
  namespace :v1 do
    post 'analysis/regression', to: 'analysis#regression'
    post 'analysis/ab-test', to: 'analysis#ab_test'
  end
end
```

## Day 3: Basic Security (4 hours)

### Step 1: Install and Configure Devise
```bash
cd code/ruby/apps/apex
bundle add devise
rails generate devise:install
rails generate devise User
rails db:migrate
```

### Step 2: Add JWT Authentication
```ruby
# Gemfile
gem 'jwt'

# app/controllers/api/v1/base_controller.rb
class Api::V1::BaseController < ApplicationController
  before_action :authenticate_api_request!
  
  private
  
  def authenticate_api_request!
    api_key = request.headers['Authorization']&.split(' ')&.last
    @current_tenant = Tenant.find_by(api_key: api_key)
    
    render json: { error: 'Unauthorized' }, status: 401 unless @current_tenant
  end
end
```

### Step 3: Implement Audit Logging
```ruby
# app/models/audit_log.rb
class AuditLog < ApplicationRecord
  belongs_to :tenant
  
  def self.log(action, details = {})
    create!(
      tenant: Current.tenant,
      action: action,
      details: details,
      ip_address: Current.ip_address,
      user_agent: Current.user_agent,
      performed_at: Time.current
    )
  end
end

# app/models/current.rb
class Current < ActiveSupport::CurrentAttributes
  attribute :tenant, :ip_address, :user_agent
end
```

## Day 4-5: Data Pipeline (8 hours)

### Step 1: CSV Upload
```ruby
# app/controllers/api/v1/data_controller.rb
class Api::V1::DataController < Api::V1::BaseController
  def upload
    file = params[:file]
    
    # Parse CSV
    csv_data = CSV.parse(file.read, headers: true)
    
    # Store in tenant schema
    DataSource.create!(
      tenant: @current_tenant,
      name: params[:name],
      data: csv_data.to_json,
      row_count: csv_data.length,
      columns: csv_data.headers
    )
    
    render json: { message: 'Data uploaded successfully' }
  end
end
```

### Step 2: Background Processing
```ruby
# app/jobs/process_data_job.rb
class ProcessDataJob < ApplicationJob
  def perform(data_source_id)
    data_source = DataSource.find(data_source_id)
    
    # Switch to tenant schema
    ActiveRecord::Base.connection.execute("SET search_path TO tenant_#{data_source.tenant_id}")
    
    # Process data
    # ... processing logic
    
    # Store results
    # ... storage logic
  ensure
    ActiveRecord::Base.connection.execute("SET search_path TO public")
  end
end
```

## Week 2: MVP Interface

### Vantage Basic UI
1. Create dashboard layout
2. Add data source management
3. Build analysis interface
4. Implement results display

### Canvas Components
```javascript
// code/ruby/apps/apex/app/javascript/components/RegressionChart.jsx
import React from 'react';
import { Line } from 'recharts';

export const RegressionChart = ({ data, regression }) => {
  return (
    <div className="regression-chart">
      <Line data={data} />
      <div className="stats">
        <p>R² = {regression.r_squared.toFixed(3)}</p>
        <p>Slope = {regression.slope.toFixed(3)} 
           [{regression.confidence_intervals.slope[0].toFixed(3)}, 
            {regression.confidence_intervals.slope[1].toFixed(3)}]
        </p>
      </div>
    </div>
  );
};
```

## Testing Everything

### Run Full Test Suite
```bash
cd code/ruby/apps/apex
rspec

cd code/ruby/gems/quant  
rspec
```

### Manual Testing with cURL
```bash
# Create tenant
curl -X POST http://localhost:3000/api/v1/tenants \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Company", "subdomain": "test"}'

# Test regression
curl -X POST http://localhost:3000/api/v1/analysis/regression \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "x_values": [1, 2, 3, 4, 5],
    "y_values": [2, 4, 5, 7, 9]
  }'
```

## Deployment Checklist

### Before First Deploy
- [ ] Multi-tenant isolation tested
- [ ] API authentication working
- [ ] Statistical functions accurate
- [ ] Audit logging functional
- [ ] Error handling comprehensive
- [ ] Rate limiting configured
- [ ] SSL certificates ready
- [ ] Environment variables set
- [ ] Database backups configured
- [ ] Monitoring alerts set up

### First Customer Demo
- [ ] Demo data prepared
- [ ] Statistical advantage clear
- [ ] Performance acceptable (<500ms)
- [ ] Security audit passed
- [ ] Documentation complete

## Common Issues & Solutions

### Issue: Tenant data leakage
**Solution:** Always reset search_path in ensure blocks

### Issue: Slow statistical calculations
**Solution:** Move to background jobs for large datasets

### Issue: Memory issues with large CSVs
**Solution:** Stream processing instead of loading entire file

### Issue: API rate limiting
**Solution:** Implement Redis-based rate limiting per tenant

## Next Steps After MVP

1. **Enhance Quant Engine**: Add more statistical models
2. **Build Canvas Library**: More visualization types
3. **Create SDK**: JavaScript SDK for embedding
4. **Add Billing**: Stripe integration with usage tracking
5. **White-Label Features**: Custom domains, branding

---

*This guide gets you from zero to working MVP. Focus on getting each piece working before moving to the next. Remember: Simple and working beats complex and broken.*
