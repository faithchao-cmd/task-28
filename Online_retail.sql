--Repeat purchase rate
SELECT
  COUNT(CASE WHEN order_count > 1 THEN 1 END) * 100.0 / COUNT(*) AS repeat_rate_pct
FROM  (
  SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS order_count
  FROM Invoices
  WHERE CustomerID IS NOT NULL
  GROUP BY CustomerID
)AS i;


--Purchase frequency, AOV, and simple CLV
SELECT
  COUNT(*) * 1.0 / COUNT(DISTINCT CustomerID) AS orders_per_customer,
  AVG(Quantity)                            AS avg_order_value,
  SUM(Quantity) / COUNT(DISTINCT CustomerID) AS revenue_per_customer
FROM Invoices;


--Monthly churn
WITH monthly AS (
  SELECT DISTINCT CustomerID, DATEADD(month, DATEDIFF(month,0,InvoiceDate),0) AS m
  FROM Invoices
)
SELECT
  cur.m AS month,
  COUNT(*) AS active_last_month,
  COUNT(CASE WHEN nxt.CustomerID IS NULL THEN 1 END) AS churned,
  COUNT(CASE WHEN nxt.CustomerID IS NULL THEN 1 END) * 100.0 / COUNT(*) AS churn_pct
FROM monthly cur
LEFT JOIN monthly nxt
  ON nxt.CustomerID = cur.CustomerID
 AND nxt.m = DATEADD(month,1,cur.m)
GROUP BY cur.m
ORDER BY cur.m;

--Segment table
WITH customer_first_item AS (
    --Finds the first invoice date for every customer
    SELECT CustomerID, MIN(InvoiceDate) AS first_date
    FROM Invoices
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
),
customer_segments AS (
    --This finds the description of what they bought on that first day to act as their "Segment"
    SELECT DISTINCT 
        i.CustomerID, 
        i.Description AS SegmentDescription
    FROM Invoices i
    INNER JOIN customer_first_item cfi 
        ON i.CustomerID = cfi.CustomerID 
        AND i.InvoiceDate = cfi.first_date
),
monthly AS (
    -- Combines customer monthly activity with their assigned item segment
    SELECT DISTINCT 
        i.CustomerID, 
        cs.SegmentDescription, 
        DATEADD(month, DATEDIFF(month, 0, i.InvoiceDate), 0) AS m
    FROM Invoices i
    INNER JOIN customer_segments cs 
        ON i.CustomerID = cs.CustomerID
)
SELECT
    cur.m AS month,
    cur.SegmentDescription,
    COUNT(*) AS active_last_month,
    COUNT(CASE WHEN nxt.CustomerID IS NULL THEN 1 END) AS churned,
    COUNT(CASE WHEN nxt.CustomerID IS NULL THEN 1 END) * 100.0 / COUNT(*) AS churn_pct
FROM monthly cur
LEFT JOIN monthly nxt 
    ON nxt.CustomerID = cur.CustomerID
    AND nxt.SegmentDescription = cur.SegmentDescription 
    AND nxt.m = DATEADD(month, 1, cur.m)
GROUP BY 
    cur.m, 
    cur.SegmentDescription
ORDER BY 
    cur.m, 
    cur.SegmentDescription;
