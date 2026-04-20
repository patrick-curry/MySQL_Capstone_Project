## Identify which marketing campaigns, channels, and customer segments drive the highest conversion and ROI:
## 1. Which campaigns perform best?
## 2. Which channels (email, social, etc.) work best?
## 3. Who are the most responsive customers?
## 4. What factors influence conversion?

##Explore data
SELECT * FROM Marketing.marketing_campaign_dataset;
DESCRIBE marketing_campaign_dataset;

##Data Arrangement
SET SQL_SAFE_UPDATES = 0;
## Remove text from duration and convert to int
UPDATE marketing_campaign_dataset
SET Duration = REPLACE(Duration, ' days', '');
ALTER TABLE marketing_campaign_dataset
MODIFY Duration INT;
# Remove text and convert to decimal
UPDATE marketing_campaign_dataset
SET Acquisition_Cost = REPLACE(Acquisition_Cost, '$', '');
UPDATE marketing_campaign_dataset
SET Acquisition_Cost = REPLACE(Acquisition_Cost, ',', '');
ALTER TABLE marketing_campaign_dataset
MODIFY Acquisition_Cost DECIMAL(10,2);
## Set Date to Datetype
ALTER TABLE marketing_campaign_dataset
MODIFY Date DATE;

## Find Nulls
SELECT
  SUM(CASE WHEN Company IS NULL THEN 1 ELSE 0 END) AS Company_nulls,
  SUM(CASE WHEN Campaign_Type IS NULL THEN 1 ELSE 0 END) AS Campaign_nulls,
  SUM(CASE WHEN Conversion_Rate IS NULL THEN 1 ELSE 0 END) AS Conversion_nulls,
  SUM(CASE WHEN ROI IS NULL THEN 1 ELSE 0 END) AS ROI_nulls
FROM marketing_campaign_dataset;

## Double Check Nulls
SELECT 
    *
FROM
    marketing_campaign_dataset
WHERE
    Impressions = 0 OR clicks IS NULL;
    
##Duplicates
select campaign_id, count(*)
FROM
    marketing_campaign_dataset
group by 1
having count(*) >1;

## Check for outliers / Numbers seem to be within thresholds
SELECT 
  MIN(Conversion_Rate), MAX(Conversion_Rate),
  MIN(ROI), MAX(ROI),
  MIN(Clicks), MAX(Clicks),
  MIN(Impressions), MAX(Impressions),
  MIN(Engagement_Score), MAX(Engagement_Score)
FROM
    marketing_campaign_dataset;

## Create Metrics
## click through rate
SELECT 
  (Clicks / Impressions) AS CTR
FROM marketing_campaign_dataset;
## cost
SELECT 
  Acquisition_Cost / Clicks AS cost_per_click
FROM marketing_campaign_dataset;

## Check Average Campaign Performance
SELECT
  Campaign_Type,
  AVG(Conversion_Rate) AS avg_conversion,
  AVG(ROI) AS avg_roi,
  AVG(Engagement_Score) AS avg_engagement
FROM marketing_campaign_dataset
GROUP BY Campaign_Type
ORDER BY avg_roi DESC;

## 1. influencers have the least clicks but the highest avg_ROI all floating around the same avg_conv /
## 2. email has the lowest conv but highest impressions / rank: inf, search, display

##Channel Effectiveness
SELECT
  Channel_Used,
  AVG(Conversion_Rate),
  AVG(ROI)
FROM marketing_campaign_dataset
GROUP BY Channel_Used
ORDER BY AVG(ROI) DESC;
## Facebook has the highest average ROI at 5.02 and IG has the lowest at 4.99 but all are close and have a CR at .079-.80

## Customer Segment
SELECT
  Customer_Segment,
  AVG(Conversion_Rate),
  AVG(ROI)
FROM marketing_campaign_dataset
GROUP BY Customer_Segment
ORDER BY AVG(Conversion_Rate) DESC;
## Conversion rates ~.80 with ROI ~.50 
#3. Foodies, Outdoor Adv, Tech Enth

##Engagement to Conversion
SELECT
  Engagement_Score,
  AVG(Conversion_Rate)
FROM marketing_campaign_dataset
GROUP BY Engagement_Score
ORDER BY Engagement_Score;
## as engagement_score increases conversion rate hovers from .0799-.085

##Cost to ROI
SELECT
  Channel_Used,
  AVG(Acquisition_Cost),
  AVG(ROI)
FROM marketing_campaign_dataset
GROUP BY 1;
## all channels average 12500$ and avgROI 4.9-5

#Analysis by Time
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month,
    AVG(ROI),
    AVG(Conversion_Rate)
FROM
    marketing_campaign_dataset
GROUP BY month
ORDER BY month;
## Each month shows a AvgROI 4.9-5 and avgConv .079-.08

