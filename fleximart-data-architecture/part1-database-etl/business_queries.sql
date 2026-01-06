/* =========================================================
   QUERY 1: Customer Purchase History
   Business Question:
   Show customer name, email, total orders placed,
   and total amount spent.
   Include only customers with at least 2 orders
   and total spending above ₹5000.
   ========================================================= */

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.subtotal) AS total_spent
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY c.customer_id
HAVING total_orders >= 2
   AND total_spent > 5000
ORDER BY total_spent DESC;



/* =========================================================
   QUERY 2: Category-wise Sales Performance
   Business Question:
   Show category-wise number of products sold,
   total quantity sold, and total revenue.
   Display only categories where revenue > ₹10,000.
   ========================================================= */

SELECT
    p.category,
    COUNT(DISTINCT p.product_id) AS total_products,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.subtotal) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
HAVING total_revenue > 10000
ORDER BY total_revenue DESC;



/* =========================================================
   QUERY 3: Monthly Sales Trend
   Business Question:
   Show month-wise total orders, monthly revenue,
   and cumulative revenue over time.
   ========================================================= */

SELECT
    MONTHNAME(o.order_date) AS month_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS monthly_revenue,
    SUM(SUM(o.total_amount)) OVER (
        ORDER BY MONTH(o.order_date)
    ) AS cumulative_revenue
FROM orders o
GROUP BY MONTH(o.order_date), MONTHNAME(o.order_date)
ORDER BY MONTH(o.order_date);

