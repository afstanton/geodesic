# Webmock

**URL:** https://github.com/bblimke/webmock

**Description:** Webmock is a library for stubbing and setting expectations on HTTP requests in Ruby. It allows you to prevent real HTTP requests from being made during tests, ensuring test isolation and speed.

**Relevance to Geodesic Projects:**
- **Testing Strategy:** Essential for testing components that interact with external APIs (e.g., [[Conduit]], [[Connector]]).
- **SaaS Factory Strategy:** Guarantees reliable and fast tests for API integrations without external network dependencies.

**Key Features:**
- Stubbing HTTP requests with custom responses.
- Setting expectations on HTTP requests.
- Disabling real HTTP requests.
- Integration with various HTTP client libraries.
- Flexible matching of request parameters.
