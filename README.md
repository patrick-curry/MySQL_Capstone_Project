# Capstone Project: Data Processing and Analysis Using MySQL
Analyzed marketing campaign data in MySQL for my Google Data Analytics Professional Certificate by cleaning and transforming datasets, engineering a custom ROI metric, and evaluating channel performance, conversion rates, and cost efficiency to identify key drivers of marketing effectiveness.

Identify which marketing campaigns, channels, and customer segments drive the highest conversion and ROI:
- Question: Which campaigns perform best?
- Question: Which channels (email, social, etc.) work best?
- Question: Who are the most responsive customers?
- Question: What factors influence conversion?

## Data:
The Marketing Campaign Performance Dataset provides valuable insights into the effectiveness of various marketing campaigns. This dataset captures the performance metrics, target audience, duration, channels used, and other essential factors that contribute to the success of marketing initiatives. With 200000 unique rows of data spanning two years, this dataset offers a comprehensive view of campaign performance across diverse companies and customer segments.

Data was provided by a [Kaggle link](https://www.kaggle.com/datasets/manishabhatt22/marketing-campaign-performance-dataset).

## Process:
- Data Ingestion:
Imported raw dataset into a MySQL database for structured storage and querying.
- Data Exploration:
Performed initial analysis to understand dataset structure, field distributions, and key variables.
- Data Backup and Integrity:
Created a duplicate of the original database to preserve raw data and ensure safe transformation.
- Data Cleaning and Transformation:
Removed non-numeric text from fields and converted them to appropriate numeric types (INT, DECIMAL).
Standardized date fields by converting them into proper date formats.
Identified and resolved null values and duplicate records to improve data consistency.
- Feature Engineering:
Developed a custom ROI column to validate and compare against the provided dataset metrics.
- Data Processing and Analysis:
Calculated overall and channel-specific costs.
Evaluated marketing channel effectiveness.
Analyzed conversion rates across different customer segments.
Assessed engagement-to-conversion relationships.
Compared cost against ROI to measure efficiency.
Tracked ROI trends over time to identify performance patterns.
- Insights and Evaluation:
Derived actionable insights on performance, efficiency, and trends to support data-driven decision-making.

## Insights:

<a href="url"><img src="https://github.com/patrick-curry/MySQL_Capstone_Project/blob/main/gdapsql1.jpg" width="500" ></a>

Campaign performance was relatively consistent across all marketing channels, with only marginal differences in conversion rates and ROI. Overall, the differences between campaigns were minimal, suggesting that no single campaign type overwhelmingly outperformed others.

<a href="url"><img src="https://github.com/patrick-curry/MySQL_Capstone_Project/blob/main/gdapsql4.jpg" width="500" ></a>

All marketing channels perform very similarly, with only marginal differences in ROI and conversion rates.

<a href="url"><img src="https://github.com/patrick-curry/MySQL_Capstone_Project/blob/main/gdapsql2.jpg" width="500" ></a>

Customer responsiveness across segments is very consistent, with only small differences in conversion rates and ROI.

<a href="url"><img src="https://github.com/patrick-curry/MySQL_Capstone_Project/blob/main/gdapsql3.jpg" width="500" ></a>

Analysis of engagement, cost, channels, and customer segments shows no strong individual factor driving conversion performance.


## Final Conclusions:
Across campaigns, channels, customer segments, engagement levels, and cost structures, performance remains highly consistent with minimal variation. The current budget allocation appears evenly distributed across channels, resulting in uniform performance outcomes.
