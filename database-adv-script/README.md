# Database Advanced Script - SQL Joins

This directory contains advanced SQL join queries for the **Airbnb Clone** database project.  
The queries demonstrate the use of `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN`.

---

## 📌 Files
- **joins_queries.sql** → SQL queries using different join types.
- **README.md** → Documentation of the queries.

---

## 📝 Queries Overview

### 1. INNER JOIN
Retrieves all bookings with the users who made them.

```sql
SELECT 
    b.id AS booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;
---


### 2.  LEFT JOIN
Retrieves all properties and their reviews, including properties without reviews.

```sql
SELECT 
    p.id AS property_id,
    p.title AS property_title,
    r.id AS review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;


3. FULL OUTER JOIN

Retrieves all users and all bookings, even if:
A user has no booking, OR
A booking is not linked to a user.


SELECT 
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;

🚀 Usage

Run the queries in your SQL client (e.g., PostgreSQL or MySQL).
Make sure your schema includes the following tables with proper relationships:

users

properties

bookings

reviews


# Subqueries in SQL (Airbnb Clone Database)

This module demonstrates the use of **non-correlated** and **correlated subqueries** on the Airbnb clone database.

---

## 1. Non-Correlated Subquery
**Query:** Find all properties where the average rating is greater than 4.0.

```sql
SELECT 
    p.id AS property_id,
    p.title,
    p.location
FROM properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
)
ORDER BY p.id;

**2. Correlated Subquery
Query: Find users who have made more than 3 bookings.**

SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3
ORDER BY u.id;

