# Airbnb Clone Database – Index Performance

This document outlines the **indexes created to improve query performance** for the Airbnb Clone database. It includes the rationale, SQL statements, and performance considerations.

---

## 1. High-Usage Columns

Based on typical queries and joins, the following columns are frequently used:

| Table      | Column          | Usage                                   |
|------------|----------------|-----------------------------------------|
| users      | email           | WHERE, JOIN, UNIQUE constraint          |
| users      | id              | JOIN with bookings and properties       |
| properties | id              | JOIN with bookings                       |
| properties | host_id         | WHERE, JOIN                               |
| bookings   | id              | JOIN with payments and users             |
| bookings   | user_id         | WHERE, JOIN                               |
| bookings   | property_id     | WHERE, JOIN                               |
| payments   | booking_id      | JOIN with bookings                        |
| reviews    | property_id     | WHERE, JOIN                               |
| reviews    | user_id         | WHERE, JOIN                               |

---

## 2. SQL CREATE INDEX Commands

```sql
-- Users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_id ON users(id);

-- Properties table
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- Bookings table
CREATE INDEX idx_bookings_id ON bookings(id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Payments table
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Reviews table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
3. Performance Considerations

Before Indexes: Queries joining large tables (e.g., users ↔ bookings ↔ properties) had slower execution times due to full table scans.

After Indexes: Indexes allow the database to efficiently locate rows, significantly reducing query execution time.

Measurement: Use EXPLAIN (PostgreSQL/MySQL) or ANALYZE to verify improved query plans.

Example:

EXPLAIN ANALYZE
SELECT u.first_name, u.last_name, b.start_date, b.end_date
FROM users u
JOIN bookings b ON u.id = b.user_id
WHERE u.email = 'john@example.com';

4. Recommendations

Regularly review query patterns and add indexes on new high-usage columns.

Avoid over-indexing, which can slow down INSERT/UPDATE/DELETE operations.

Consider composite indexes for queries filtering on multiple columns.

5. Directory Structure
alx-airbnb-database/
└── database-adv-script/
    ├── database_index.sql
    └── index_performance.md
