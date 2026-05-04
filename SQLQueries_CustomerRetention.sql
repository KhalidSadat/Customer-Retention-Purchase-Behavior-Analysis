
WITH CustomerStatus AS (
		SELECT 
			InvoiceDate,
			InvoiceId,
			CustomerId,
			COUNT(*) OVER (PARTITION BY CustomerId) AS TotalInvoices,
			FIRST_VALUE(InvoiceDate) OVER( PARTITION BY CustomerId ORDER BY InvoiceDate) FirstPurchaseDate,
			LAST_VALUE(InvoiceDate) OVER( PARTITION BY CustomerId ORDER BY InvoiceDate ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) LastPurchaseDate
		FROM Invoice),

		CustomerRetainStatus AS (

		SELECT 
		*,
		CASE 
			WHEN TotalInvoices =1 THEN 'One-time'
			ELSE 'Returning'
		END AS CustomerType

		FROM CustomerStatus
		),

		CustomerLag AS (

		SELECT 
			*,
			LAG(InvoiceDate) OVER (PARTITION BY CustomerId ORDER BY InvoiceDate)AS PreviousInvoiceDate

		FROM CustomerRetainStatus
		),

		PurchaseGap AS(

		SELECT
			CustomerId,
			InvoiceDate,
			PreviousInvoiceDate,
			DATEDIFF(DAY, PreviousInvoiceDate, InvoiceDate) AS DaysBetweenPurchases,
			FirstPurchaseDate,
			LastPurchaseDate,
			TotalInvoices,
			CustomerType
		FROM CustomerLag)

SELECT
	CustomerId,
    InvoiceDate,
    PreviousInvoiceDate,
	DaysBetweenPurchases,
	AVG(CAST(DaysBetweenPurchases AS FLOAT)) OVER (PARTITION BY CustomerId)AvgPurchaseGap,
	FirstPurchaseDate,
    LastPurchaseDate,
    TotalInvoices,
    CustomerType
FROM PurchaseGap