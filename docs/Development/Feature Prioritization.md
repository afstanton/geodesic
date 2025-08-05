# Feature Prioritization Framework

**Purpose:** To provide a systematic and objective framework for deciding what to build next, ensuring development effort is always focused on the most valuable features for achieving our [[Interim Goals]].

---

## The RICE Scoring Model

We will use the RICE model to score and rank potential features. This model forces us to think critically about *why* we are building something and what impact we expect it to have.

The score is calculated as:

**`(Reach * Impact * Confidence) / Effort`**

### 1. Reach

*   **Question:** How many users will this feature affect within a single time period (e.g., a month)?
*   **Measurement:** Estimate the number of users who will use the feature. For [[Vantage]], this is direct users. For [[Apex Analytics Platform]], this could be the number of white-label customers or their end-users.

### 2. Impact

*   **Question:** How much will this feature impact individual users?
*   **Measurement:** Score on a scale from 0.25 to 3.
    *   **3** = Massive impact (e.g., a game-changing feature for most users)
    *   **2** = High impact
    *   **1** = Medium impact
    *   **0.5** = Low impact
    *   **0.25** = Minimal impact

### 3. Confidence

*   **Question:** How confident are we in our estimates for Reach and Impact?
*   **Measurement:** Express as a percentage.
    *   **100%** = High confidence (we have quantitative data or direct user research).
    *   **80%** = Medium confidence (we have qualitative insights or market analysis).
    *   **50%** = Low confidence (this is a speculative idea, a "moonshot").

### 4. Effort

*   **Question:** How much total time will this feature require from the entire team (product, design, development)?
*   **Measurement:** Estimate in "person-weeks." This is a rough estimate of the total concentrated work required.

## Process

1.  **Feature Backlog:** Maintain a list of all potential features.
2.  **Quarterly Scoring:** Once per quarter, score all features in the backlog using the RICE model.
3.  **Ranked List:** Sort the features by their RICE score.
4.  **Roadmap Planning:** Use the ranked list as the primary input for planning the work for the next development cycle, as outlined in the [[Development Roadmap]].
