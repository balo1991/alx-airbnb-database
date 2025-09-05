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

-- Example usage to measure performance:
-- BEFORE INDEXES:
-- EXPLAIN ANALYZE SELECT u.first_name, u.last_name, b.start_date, b.end_date
-- FROM users u
-- JOIN bookings b ON u.id = b.user_id
-- WHERE u.email = 'john@example.com';

-- AFTER INDEXES:
-- EXPLAIN ANALYZE SELECT u.first_name, u.last_name, b.start_date, b.end_date
-- FROM users u
-- JOIN bookings b ON u.id = b.user_id
-- WHERE u.email = 'john@example.com';
