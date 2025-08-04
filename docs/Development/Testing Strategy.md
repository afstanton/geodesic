# Testing Strategy

**Purpose**: To define a consistent and robust testing strategy for the Geodesic project, ensuring the quality and reliability of the SaaS applications.

## Testing Levels

- **Unit Tests**: Each class and method should have comprehensive unit tests to verify its individual behavior. These tests should be fast and isolated.
- **Integration Tests**: These tests will verify the interactions between different components, particularly between engines. For example, an integration test might verify that a user from the [[Aegis]] can create a dashboard in the [[Canvas]].
- **End-to-End (E2E) Tests**: These tests will simulate real user scenarios from the browser, using a tool like Cypress or Capybara. They will cover the critical user flows defined in [[User Flows]].

## Tooling

- **Testing Framework**: [[RSpec]] will be the standard testing framework for all Ruby code.
- **Factories**: [[FactoryBot]] will be used to create test data.
- **Mocking/Stubbing**: [[RSpec Mocks]] will be used for mocking and stubbing.
- **HTTP Request Stubbing**: [[Webmock]] for stubbing HTTP requests.
- **HTTP Request Recording**: [[VCR]] for recording and replaying HTTP interactions.
- **E2E Testing**: [[Capybara]] with a headless browser driver will be used for E2E testing.

## Engine Testing

- **In Isolation**: Each engine will have its own test suite that can be run independently. This will ensure that each engine is a self-contained, reusable component.
- **As Part of the Host App**: The main application will have a test suite that includes integration and E2E tests that cover the interactions between the engines.

## Continuous Integration (CI)

A CI pipeline (e.g., using GitHub Actions) will be set up to run all tests automatically on every push to the repository. This will ensure that the codebase is always in a releasable state.
