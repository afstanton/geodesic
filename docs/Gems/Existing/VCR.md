# VCR

**URL:** https://github.com/vcr/vcr

**Description:** VCR is a library for recording and replaying HTTP interactions during tests. It works by wrapping your test suite and recording HTTP requests to YAML files (cassettes). Subsequent test runs can then replay these interactions, making tests faster and more reliable.

**Relevance to Geodesic Projects:**
- **Testing Strategy:** Complements Webmock by providing a way to record and replay complex HTTP interactions, especially useful for integration tests with external APIs.
- **SaaS Factory Strategy:** Speeds up tests and reduces reliance on external services during development and CI.

**Key Features:**
- Recording and replaying HTTP requests.
- Cassette management for different test scenarios.
- Integration with various testing frameworks and HTTP client libraries.
- Customizable request matching and filtering.
- Automatic handling of sensitive data.
