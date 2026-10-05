## Online Retail Customer Repeat Purchase Analysis

## Project Overview

This project analyzes customer purchasing behavior using the Online Retail dataset to understand **customer loyalty, repeat purchases, purchasing activity, and churn**.

The analysis uses SQL to turn transactional data into business-focused metrics that can help a retail business understand which customers return, how purchasing behavior changes over time, and where customer retention may need attention.

## Business Objective

The main objective is to answer:

- How many customers make repeat purchases?
- How frequently do customers purchase?
- How does customer activity change month by month?
- Which customers are at risk of being lost?
- Do different customer segments show different retention patterns?

These insights can support better **customer retention, marketing, and business planning decisions**.

## Analysis Performed

### 1. Repeat Purchase Rate

The repeat purchase rate measures the percentage of customers who have made more than one distinct purchase.

The analysis counts distinct invoice numbers for each customer to avoid treating multiple products from the same invoice as separate orders.

**Business value:**
- Measures customer loyalty.
- Helps evaluate customer retention.
- Provides a baseline for improving repeat sales.
- Helps businesses understand whether customers are returning after their initial purchase.

### 2. Purchase Frequency and Customer Activity

The analysis calculates purchasing activity using:

- Orders per customer
- Average quantity
- Quantity per customer

**Business value:**
- Helps identify purchasing patterns.
- Supports customer engagement strategies.
- Provides information that can help businesses plan promotions and retention campaigns.

### 3. Monthly Customer Churn

Customer activity is tracked month by month to identify customers who were active in one month but did not make a purchase in the following month.

The analysis calculates:

- Active customers
- Churned customers
- Churn percentage

**Business value:**
- Helps identify changes in customer retention.
- Highlights periods where customer loss increases.
- Can help businesses investigate why customers are not returning.
- Supports targeted customer retention strategies.

### 4. Customer Segmentation

Customers are assigned a segment based on the description of the first item they purchased.

Monthly activity is then compared across these segments.

**Business value:**
- Helps identify which customer groups show stronger or weaker retention.
- Can support targeted marketing campaigns.
- Helps businesses understand customer behavior based on their initial purchase.
- Provides a starting point for more advanced customer segmentation.

## Key Business Questions

This analysis can help answer questions such as:

1. What percentage of customers become repeat customers?
2. How frequently do customers purchase?
3. How many customers are lost from one month to the next?
4. Which customer segments have higher churn?
5. Where should customer retention efforts be focused?

## Business Benefits

The analysis can help a retail business:

- **Improve customer retention** by identifying churn patterns.
- **Increase repeat purchases** by understanding customer loyalty.
- **Target marketing efforts** toward specific customer groups.
- **Monitor customer behavior** over time.
- **Support data-driven decisions** using measurable customer metrics.

## Tools Used

- Microsoft SQL Server
- T-SQL
- Online Retail Dataset

## SQL Concepts Used

- `COUNT(DISTINCT)`
- `CASE WHEN`
- Common Table Expressions (CTEs)
- Subqueries
- `GROUP BY`
- `LEFT JOIN`
- Date functions
- Customer segmentation
- Monthly retention and churn analysis

## Project Outcome

The project demonstrates how transactional retail data can be transformed into customer-focused business insights.

Rather than simply counting transactions, the analysis focuses on **customer loyalty, retention, purchasing behavior, and churn**, providing metrics that can support practical business decisions.

## Conclusion

Understanding customer behavior is important for maintaining long-term revenue and customer relationships.

By measuring repeat purchases, purchasing activity, monthly churn, and customer segments, businesses can better understand where customers are being retained and where retention strategies may need improvement.
