# Online Retail Data Analysis & Migration Pipeline

## Project Overview
This repository contains the optimized and refactored SQL scripts used to drive customer retention analytics from raw transactional e-commerce datasets. The migration addresses critical cross-platform compiler discrepancies moving from a legacy PostgreSQL prototyping environment to a production Microsoft SQL Server (T-SQL) ecosystem.

## Core Analytics Delivered
1. **True Repeat Purchase Rate**: Implements an aggregate window subquery that maps individual buyers against distinct invoice identifiers, removing line-item skewing.
2. **Monthly Customer Churn Tracking**: Implements an operational self-join matrix evaluating forward-looking customer engagement month-over-month, segmentable by geographic fields (`Country`).

## Implementation Checklist
- [x] Correct line-item over-counting anomalies via `DISTINCT` invoice tracking.
- [x] Migrate `DATE_TRUNC` functions into native T-SQL `DATEDIFF`/`DATEADD` blocks.
- [x] Swap out non-standard SQL `FILTER (WHERE...)` aggregate expressions with clean conditional `CASE WHEN` clauses.
- [x] Establish a local subquery table alias requirement profile (`AS i`) across all calculation workflows to prevent runtime parser breakage.
