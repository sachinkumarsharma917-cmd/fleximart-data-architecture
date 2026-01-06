# FlexiMart Data Warehouse – Star Schema Design

## Section 1: Schema Overview

### FACT TABLE: fact_sales

**Grain:**  
One row per product per order line item.

**Business Process:**  
Sales transactions for FlexiMart.

**Measures (Numeric Facts):**
- quantity_sold: Number of units sold
- unit_price: Price per unit at the time of sale
- discount_amount: Discount applied on the sale
- total_amount: Final sales amount (quantity × unit_price - discount)

**Foreign Keys:**
- date_key → dim_date
- product_key → dim_product
- customer_key → dim_customer

---

### DIMENSION TABLE: dim_date

**Purpose:**  
Stores date-related information for time-based analysis.

**Attributes:**
- date_key (PK): Surrogate key in YYYYMMDD format
- full_date: Actual calendar date
- day_of_week: Day name (Monday, Tuesday, etc.)
- day_of_month: Numeric day of the month
- month: Month number (1–12)
- month_name: Month name (January, February, etc.)
- quarter: Quarter of the year (Q1–Q4)
- year: Calendar year
- is_weekend: Indicates whether the date is a weekend

---

### DIMENSION TABLE: dim_product

**Purpose:**  
Stores product-related descriptive information.

**Attributes:**
- product_key (PK): Surrogate key
- product_id: Business product identifier
- product_name: Name of the product
- category: Product category
- subcategory: Product sub-category
- unit_price: Standard product price

---

### DIMENSION TABLE: dim_customer

**Purpose:**  
Stores customer-related descriptive information.

**Attributes:**
- customer_key (PK): Surrogate key
- customer_id: Business customer identifier
- customer_name: Full name of the customer
- city: Customer city
- state: Customer state
- customer_segment: Segment (Retail, Corporate, etc.)

---

## Section 2: Design Decisions

The star schema is designed at the transaction line-item level to capture the most detailed sales data possible. This granularity allows detailed analysis such as product-level sales, customer behavior, and time-based trends.

Surrogate keys are used instead of natural keys to improve performance and handle changes in source systems without affecting the data warehouse. For example, if a product ID changes in the source system, the surrogate key remains stable in the warehouse.

This design supports drill-down and roll-up analysis efficiently. Analysts can drill down from yearly to monthly sales or roll up from product-level data to category-level summaries using the dimension tables.

---

## Section 3: Sample Data Flow

**Source Transaction:**  
Order #101, Customer "John Doe", Product "Laptop", Quantity: 2, Price: 50000

**Data Warehouse Representation:**

fact_sales:  
{
  date_key: 20240115,  
  product_key: 5,  
  customer_key: 12,  
  quantity_sold: 2,  
  unit_price: 50000,  
  total_amount: 100000  
}

dim_date:  
{ date_key: 20240115, full_date: '2024-01-15', month: 1, quarter: 'Q1', year: 2024 }

dim_product:  
{ product_key: 5, product_name: 'Laptop', category: 'Electronics' }

dim_customer:  
{ customer_key: 12, customer_name: 'John Doe', city: 'Mumbai' }
