# User Flows

**Purpose**: To outline the core user experiences and interaction flows for the Business Intelligence SaaS.

## 1. Onboarding Flow

**Goal**: A new user signs up, connects a data source, and creates their first dashboard.

1.  **Sign Up**: User provides email and password to create an account.
2.  **Welcome Screen**: A brief welcome message and a call-to-action to connect a data source.
3.  **Connect Data Source**: User selects a data source type (e.g., PostgreSQL), provides credentials, and tests the connection.
4.  **Data Source Connected**: A confirmation message and a call-to-action to create a dashboard.
5.  **Create Dashboard**: User gives the dashboard a name.
6.  **Add Widget**: User is prompted to add their first widget to the dashboard.
7.  **Write Query**: User writes a SQL query to retrieve data for the widget.
8.  **Select Chart Type**: User selects a chart type (e.g., line chart).
9.  **Widget Created**: The widget appears on the dashboard.

## 2. Core Analysis Flow

**Goal**: A user performs a statistical analysis on a dataset.

1.  **Select Data**: User selects a data source and a table to analyze.
2.  **Choose Analysis**: User selects a statistical analysis to perform (e.g., linear regression).
3.  **Configure Analysis**: User selects the columns to be used as independent and dependent variables.
4.  **Run Analysis**: The analysis is run, and the results are displayed.
5.  **Interpret Results**: The results are presented in a clear, easy-to-understand format, with explanations of the key statistical measures.

## 3. Alerting Flow

**Goal**: A user creates an alert to be notified of a data anomaly.

1.  **Select Widget**: User selects a widget on a dashboard to create an alert for.
2.  **Create Alert**: User gives the alert a name.
3.  **Define Condition**: User defines the condition for the alert (e.g., "when the value is greater than 100").
4.  **Choose Notification Channel**: User selects how they want to be notified (e.g., email).
5.  **Alert Created**: A confirmation message is displayed.
