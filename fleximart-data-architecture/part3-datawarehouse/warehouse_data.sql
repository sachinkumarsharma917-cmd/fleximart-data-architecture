-- Database: fleximart_dw

CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day_of_week VARCHAR(10),
    day_of_month INT,
    month INT,
    month_name VARCHAR(10),
    quarter VARCHAR(2),
    year INT,
    is_weekend BOOLEAN
);

CREATE TABLE dim_product (
    product_key INT PRIMARY KEY AUTO_INCREMENT,
    product_id VARCHAR(20),
    product_name VARCHAR(100),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    unit_price DECIMAL(10,2)
);

CREATE TABLE dim_customer (
    customer_key INT PRIMARY KEY AUTO_INCREMENT,
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    customer_segment VARCHAR(20)
);

CREATE TABLE fact_sales (
    sale_key INT PRIMARY KEY AUTO_INCREMENT,
    date_key INT NOT NULL,
    product_key INT NOT NULL,
    customer_key INT NOT NULL,
    quantity_sold INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount_amount DECIMAL(10,2) DEFAULT 0,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key)
);
USE fleximart_dw;

INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,0),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,0),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,1),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,1),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,0),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,0),
(20240120,'2024-01-20','Saturday',20,1,'January','Q1',2024,1),
(20240125,'2024-01-25','Thursday',25,1,'January','Q1',2024,0),
(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,0),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,1),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,0),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,1),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,0),
(20240218,'2024-02-18','Sunday',18,2,'February','Q1',2024,1),
(20240220,'2024-02-20','Tuesday',20,2,'February','Q1',2024,0),
(20240225,'2024-02-25','Sunday',25,2,'February','Q1',2024,1),
(20240228,'2024-02-28','Wednesday',28,2,'February','Q1',2024,0);

INSERT INTO dim_product (product_id,product_name,category,subcategory,unit_price) VALUES
('P001','Samsung Galaxy S21','Electronics','Mobile',45999),
('P002','HP Laptop','Electronics','Laptop',52999),
('P003','iPhone 13','Electronics','Mobile',69999),
('P004','Sony Headphones','Electronics','Audio',1999),
('P005','Dell Monitor','Electronics','Monitor',12999),
('P006','Nike Shoes','Fashion','Footwear',3499),
('P007','Puma Sneakers','Fashion','Footwear',4599),
('P008','Levis Jeans','Fashion','Clothing',2999),
('P009','Adidas T-Shirt','Fashion','Clothing',1299),
('P010','Basmati Rice 5kg','Groceries','Grains',650),
('P011','Organic Honey','Groceries','Food',450),
('P012','Organic Almonds','Groceries','Dry Fruits',899),
('P013','Masoor Dal','Groceries','Pulses',120),
('P014','Samsung TV','Electronics','TV',32999),
('P015','Boat Earbuds','Electronics','Audio',1499);

INSERT INTO dim_customer (customer_id,customer_name,city,state,customer_segment) VALUES
('C001','Rahul Sharma','Bangalore','Karnataka','Medium'),
('C002','Priya Patel','Mumbai','Maharashtra','High'),
('C003','Amit Kumar','Delhi','Delhi','Low'),
('C004','Sneha Reddy','Hyderabad','Telangana','Medium'),
('C005','Vikram Singh','Chennai','Tamil Nadu','High'),
('C006','Anjali Mehta','Bangalore','Karnataka','Medium'),
('C007','Ravi Verma','Pune','Maharashtra','Low'),
('C008','Pooja Iyer','Bangalore','Karnataka','Medium'),
('C009','Karthik Nair','Kochi','Kerala','High'),
('C010','Deepa Gupta','Delhi','Delhi','Medium'),
('C011','Arjun Rao','Hyderabad','Telangana','High'),
('C012','Lakshmi Krishnan','Chennai','Tamil Nadu','Low');

INSERT INTO fact_sales
(date_key,product_key,customer_key,quantity_sold,unit_price,discount_amount,total_amount)
VALUES
(20240101,1,1,1,45999,0,45999),
(20240105,2,2,1,52999,0,52999),
(20240106,3,3,1,69999,2000,67999),
(20240107,4,4,2,1999,0,3998),
(20240110,5,5,1,12999,500,12499),
(20240115,6,6,2,3499,0,6998),
(20240120,7,7,1,4599,0,4599),
(20240125,8,8,2,2999,0,5998),
(20240201,9,9,3,1299,0,3897),
(20240203,10,10,5,650,0,3250),
(20240205,11,11,4,450,0,1800),
(20240210,12,12,2,899,0,1798),
(20240214,13,1,6,120,0,720),
(20240218,14,2,1,32999,1000,31999),
(20240220,15,3,2,1499,0,2998),
(20240225,1,4,1,45999,0,45999),
(20240228,2,5,1,52999,0,52999);

