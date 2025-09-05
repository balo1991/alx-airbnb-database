-- Step 1: Rename the original bookings table (if it exists)
ALTER TABLE bookings RENAME TO bookings_old;

-- Step 2: Create the new partitioned table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions based on yearly ranges
CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE bookings_future PARTITION OF bookings
    FOR VALUES FROM ('2026-01-01') TO (MAXVALUE);

-- Step 4: Insert data from old table into new partitioned table
INSERT INTO bookings (booking_id, user_id, property_id, start_date, end_date, status, created_at)
SELECT booking_id, user_id, property_id, start_date, end_date, status, created_at
FROM bookings_old;

-- Step 5: Example query before partitioning
-- (Run this on bookings_old for baseline performance)
EXPLAIN ANALYZE
SELECT * FROM bookings_old
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';

-- Step 6: Example query after partitioning
-- (Run this on new partitioned bookings table)
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';
