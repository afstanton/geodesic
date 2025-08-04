# Existing Rails Engines for Geodesic Projects

This directory contains documentation for third-party Rails engines that could accelerate development of the Business Intelligence and Marketing Analytics SaaS applications.

## Administration Engines

- **[[Administrate]]** - A flexible dashboard for admin interfaces.

## Authentication & Authorization Engines

- **[[Devise]]** - Comprehensive authentication solution with flexible modules

## E-commerce Platform Engines (for architectural reference)

- **[[Spree Commerce]]** - Complete e-commerce platform with modular architecture
- **[[Solidus]]** - Modern e-commerce platform with improved architecture and developer experience

## Payment & Billing Engines

- **[[Pay]]** - A Rails engine for handling payments with Stripe and Braintree.

## Evaluation Criteria

When evaluating engines for integration:

1. **Architectural Compatibility** - Does it align with the modular SaaS Factory Strategy?
2. **Customization Flexibility** - Can it be adapted for specific business requirements?
3. **Maintenance Burden** - Is it actively maintained with good community support?
4. **Performance Impact** - Will it affect application performance significantly?
5. **Integration Complexity** - How difficult is it to integrate with existing systems?
6. **License Compatibility** - Does the license allow for commercial SaaS use?

## Usage in SaaS Factory Strategy

Engines provide substantial functionality that can be shared across multiple SaaS applications. They typically include:

- Database migrations and models
- Controllers and routing
- Views and UI components
- Configuration and initializers
- API endpoints
- Administrative interfaces

Engines are mounted in the main application and can be customized through configuration, decorators, and overrides while maintaining upgradability.
"