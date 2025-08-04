# External Script Runner

**Purpose**: To provide a simple and robust way to execute external scripts (e.g., R, Python) from a Ruby application, handling data serialization and error reporting.

**Related To**: [[Statistical Analysis Engine]]

## Core Features

- **Script Execution**: Run scripts and capture their standard output and standard error.
- **Data Serialization**: Automatically serialize Ruby objects to JSON for the external script to read, and parse JSON output from the script back into Ruby objects.
- **Error Handling**: Raise specific errors for common issues like script not found, execution timeouts, or non-zero exit codes.
- **Configurable**: Allow configuration of script paths and execution timeouts.

## Technical Design

- A single primary service class (e.g., `ExternalScript::Runner`).
- No models or controllers.
- Uses Ruby's built-in `Open3` for script execution.
- Relies on the standard `json` gem for serialization.
