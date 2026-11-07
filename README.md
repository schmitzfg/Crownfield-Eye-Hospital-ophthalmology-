# Crownfield Eye Hospital Database

## 1. Project Overview

This project is a relational database designed for Crownfield Eye Hospital. It manages patient information, appointments, clinicians, clinics, diagnoses, prescriptions, medicines and follow-up appointments.

The database was developed using MySQL.

## 2. Technologies Used

- MySQL Community Server 9.7.2
- MySQL Workbench
- SQL

## 3. Project Files

| File | Description |
|---|---|
| 01_schema.sql | Creates the database and all 11 tables, including primary and foreign keys. |
| 01_2_insert_sample_data.sql | Inserts sample data into the tables. |
| 02_individual_queries.sql | Contains SQL queries, JOINs, subqueries, UPDATE and DELETE examples. |
| 03_procedure_and_trigger.sql | Creates a stored procedure to retrieve patient appointments and triggers to validate and record Follow-Up priority changes. |
| 04_security.sql | Creates database users, assigns permissions and demonstrates password hashing and SQL injection prevention. |
| 05_ERD.png | Entity Relationship Diagram showing the database structure and relationships. |

## 4. Setup Instructions

1. Install MySQL Community Server and MySQL Workbench.
2. Open MySQL Workbench and connect to the MySQL server.
3. Open and execute 01_schema.sql to create the database and tables.
4. Open and execute 01_2_insert_sample_data.sql to insert sample records into the tables.
5. Execute 02_individual_queries.sql to test SQL queries, including UPDATE, DELETE, JOINs and subqueries.
6. Execute 03_procedure_and_trigger.sql to create and test stored procedures and triggers.
7. Execute 04_security.sql to configure database users and permissions.
8. Open 05_ERD.png to view the Entity Relationship Diagram.

## 5. Execution Order

The SQL files should be executed in the following order:

1. 01_schema.sql
2. 02_insert_sample_data.sql
3. 03_individual_queries.sql
4. 04_security.sql

## 6. Assumptions

- The database uses fictional patient and hospital information.
- Each patient can have multiple appointments.
- Each appointment is assigned to one clinician and one clinic.
- A patient may have multiple diagnoses and prescriptions.
- A prescription can contain one or more medicines.
- Follow-up records are linked to appointments.
- Primary keys uniquely identify records, while foreign keys maintain relationships between tables.
- Password hashing with SHA2 is included for educational demonstration only. Production systems should use dedicated password-hashing algorithms such as Argon2id or bcrypt.

## 7. Entity Relationship Diagram

05_ERD.png