-- ====================================
-- Sample Data for Airbnb Database
-- ====================================

-- ==========================
-- Users
-- ==========================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    ('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '123-456-7890', 'guest'),
    ('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '555-123-4567', 'host'),
    ('33333333-3333-3333-3333-333333333333', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw3', NULL, 'guest'),
    ('44444444-4444-4444-4444-444444444444', 'Diana', 'Lopez', 'diana@example.com', 'hashed_pw4', '222-333-4444', 'admin');

-- ==========================
-- Properties
-- ==========================
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
    ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 'Cozy Cottage', 'A small cozy cottage in the countryside.', 'Nashville, TN', 120.00),
    ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '22222222-2222-2222-2222-222222222222', 'Beachfront Villa', 'Luxury villa with private beach access.', 'Miami, FL', 350.00);

-- ==========================
-- Bookings
-- ==========================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    ('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2025-07-01', '2025-07-05', 480.00, 'confirmed'),
    ('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', '2025-08-10', '2025-08-15', 1750.00, 'pending');

-- ==========================
-- Payments
-- ==========================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
    ('ppppppp1-pppp-pppp-pppp-ppppppppppp1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 480.00, 'credit_card'),
    ('ppppppp2-pppp-pppp-pppp-ppppppppppp2', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 875.00, 'paypal'); -- partial payment

-- ==========================
-- Reviews
-- ==========================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
    ('rrrrrrr1-rrrr-rrrr-rrrr-rrrrrrrrrrr1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay! The cottage was perfect.'),
    ('rrrrrrr2-rrrr-rrrr-rrrr-rrrrrrrrrrr2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 4, 'Beautiful villa, but a bit expensive.');

-- ==========================
-- Messages
-- ==========================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
    ('mmmmmmm1-mmmm-mmmm-mmmm-mmmmmmmmmmm1', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, is your cottage available in July?'),
    ('mmmmmmm2-mmmm-mmmm-mmmm-mmmmmmmmmmm2', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Yes Alice, it’s available from July 1-5!');
