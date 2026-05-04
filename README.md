** Customer Retention & Purchase Behavior Analysis**

## 🎯 Objective
This project analyzes customer purchasing behavior to understand:
- Customer retention patterns
- Purchase frequency
- Time between purchases
- Identification of loyal vs one-time customers

---

## 📦 Dataset
- Chinook Database
- Tables used:
  - `Invoice`
  - `Customer`

---

## 🧠 Business Problem

The goal is to help the business answer:

- Do customers return after their first purchase?
- How frequently do customers make purchases?
- How long does it take for customers to return?
- Who are loyal customers vs one-time buyers?

---

## 🛠️ Tools & Techniques

- SQL Server
- Common Table Expressions (CTEs)
- Window Functions:
  - `COUNT() OVER()`
  - `FIRST_VALUE()`
  - `LAST_VALUE()`
  - `LAG()`
  - `AVG() OVER()`
- `DATEDIFF()` for time analysis

---

## 📌 Analysis Steps

### 1. Customer Purchase Frequency
- Count total invoices per customer

### 2. First & Last Purchase
- Identify first and most recent purchase date per customer

### 3. Customer Segmentation
- Classify customers:
  - `One-time` → Only 1 purchase
  - `Returning` → More than 1 purchase

### 4. Purchase Gap Analysis
- Calculate days between consecutive purchases using `LAG()`

### 5. Average Purchase Gap
- Compute average number of days between purchases per customer

---

## 📊 Key Output Columns

- CustomerId  
- InvoiceDate  
- PreviousInvoiceDate  
- DaysBetweenPurchases  
- AvgPurchaseGap  
- FirstPurchaseDate  
- LastPurchaseDate  
- TotalInvoices  
- CustomerType  

---

## 📈 Key Business Insights

### 🔹 1. Customer Retention
- Majority of customers are **returning customers**
- This indicates a **healthy retention rate**
- However, presence of one-time customers suggests opportunity for improvement

---

### 🔹 2. Purchase Frequency
- Customers with higher invoice counts represent **high engagement**
- These customers are potential targets for:
  - Loyalty programs  
  - Personalized marketing  

---

### 🔹 3. Time Between Purchases
- Purchase gaps vary significantly across customers
- Some customers return quickly, while others take longer

👉 This indicates:
- Different customer behavior segments  
- Need for targeted engagement strategies  

---

### 🔹 4. Average Purchase Gap
- Customers with lower average gap are **frequent buyers**
- Customers with higher gap are **at risk of churn**

👉 Business can:
- Send reminders or promotions  
- Re-engage inactive customers  

---

### 🔹 5. Customer Segmentation Insight

| Segment        | Description |
|---------------|------------|
| One-time      | Low retention, needs re-engagement |
| Returning     | Core customer base |
| Frequent      | High-value loyal customers |
| Occasional    | Medium engagement |

---

## 💡 Business Recommendations

- Focus on **retaining returning customers**
- Target **one-time customers** with follow-up campaigns
- Reward **frequent buyers** with loyalty programs
- Use timing insights to **optimize marketing campaigns**

---

## 🚀 Learning Outcome

This project demonstrates:

- Ability to perform **end-to-end data analysis using SQL**
- Strong understanding of **window functions**
- Capability to translate data into **business insights**
- Real-world analytical thinking for decision-making

---

## 📁 Files Included

- `SQLQueries_CustomerRetention.sql` → All SQL queries used in the analysis  
- `README.md` → Project documentation and insights  

---

## 📌 Author
Saied Khalid
