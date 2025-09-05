# Database Performance Monitoring Report

## Objective
The goal of this task is to **continuously monitor and refine database performance** for the Airbnb Clone project by analyzing query execution plans and making schema adjustments where necessary.

---

## 1. Monitoring Tools
- **`EXPLAIN` / `EXPLAIN ANALYZE`** → Provides execution plan and actual run time.  
- **`SHOW PROFILE`** (MySQL) → Breaks down query stages and resource usage.  
- **`pg_stat_statements`** (PostgreSQL) → Tracks execution statistics for frequently used queries.  

---

## 2. Queries Monitored

### Query 1: Retrieve all bookings with user details
```sql
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.end_date, b.status,
       u.user_id, u.first_name, u.last_name, u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
WHERE b.start_date BETWEEN '2025-01-01' AND '2025-12-31';
