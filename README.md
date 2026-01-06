# FlexiMart Data Architecture Project

**Student Name:** Sachin  
**Student ID:** [bitsom_ba_25071130 
**Email:** [sachinkumarsharma917@gmail.com]
**Date:** 2026-01-05  

---

## Project Overview

This project implements a complete data architecture solution for FlexiMart, an e-commerce company. The solution includes building an ETL pipeline to load raw CSV data into a relational database, performing business analysis using SQL queries, evaluating NoSQL database suitability, and designing a data warehouse using a star schema for analytical reporting.

---

## Repository Structure

fleximart-data-architecture/
├── part1-database-etl/
│   ├── etl_pipeline.py
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   └── data_quality_report.txt
│
├── part2-nosql/
│   ├── nosql_analysis.md
│   ├── mongodb_operations.js
│   └── products_catalog.json
│
├── part3-datawarehouse/
│   ├── star_schema_design.md
│   ├── warehouse_schema.sql
│   ├── warehouse_data.sql
│   └── analytics_queries.sql
│
└── README.md

---

## Technologies Used

- Python 3.x
- Pandas
- MySQL 8.0
- MongoDB
- Jupyter Notebook

---

## Setup Instructions

### Relational Database Setup (MySQL)

```bash
CREATE DATABASE fleximart;
CREATE DATABASE fleximart_dw;
