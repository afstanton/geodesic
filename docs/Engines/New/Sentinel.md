# Alerting Engine

**Purpose**: To provide a framework for defining, detecting, and notifying users of important events and anomalies in their data.

**Related To**: [[Vantage]]

## Core Features

- **Alert Rule Builder**: A UI for creating custom alert rules based on data thresholds, trends, or statistical anomalies.
- **Anomaly Detection**:
  - Statistical Process Control (SPC) methods.
  - Outlier detection.
- **Notification Channels**: Integration with various notification channels, including:
  - Email
  - Slack
  - Webhooks
- **Alert History**: A log of all triggered alerts.

## Technical Design

- **Models**: `AlertRule`, `Alert`, `NotificationChannel`.
- **Jobs**: Background jobs (using [[Sidekiq]]) to continuously evaluate alert rules against the data.
- **Dependencies**: [[Noticed]] for sending notifications.
