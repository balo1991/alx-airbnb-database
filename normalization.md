# Database Normalization to 3NF

## Objective
Ensure that the Airbnb-style database schema is normalized to **Third Normal Form (3NF)** in order to minimize redundancy, maintain data integrity, and improve query efficiency.

---

## Step 1: First Normal Form (1NF)
**Requirements:**
- Eliminate repeating groups.
- Ensure each column contains atomic (indivisible) values.
- Each row is uniquely identifiable with a primary key.

**Validation:**
- All entities (User, Property, Booking, Payment, Review, Message) have defined primary keys.
- Attributes are atomic (e.g., no multi-valued fields like a list of amenities inside one column).
- No repeating groups exist.

✅ The schema is in **1NF**.

---

## Step 2: Second Normal Form (2NF)
**Requirements:**
- Must already be in 1NF.
- Eliminate partial dependencies (no non-key attribute depends on part of a composite key).

**Validation:**
- Each table uses a **single-column primary key** (UUIDs), not a composite key.
- Therefore, no partial dependencies exist.

✅ The schema is in **2NF**.

---

## Step 3: Third Normal Form (3NF)
**Requirements:**
- Must already be in 2NF.
- Eliminate transitive dependencies (non-key attributes should depend only on the key, not on other non-key attributes).

**Review by Entity:**

### User
- Attributes (name, email, role, etc.) depend only on `user_id`.
- No transitive dependencies.

### Property
- Attributes (host_id, name, description, location, pricepernight, timestamps) depend only on `property_id`.
- `host_id` is a foreign key and does not introduce redundancy.

### Booking
- Attributes (property_id, user_id, dates, total_price, status) depend only on `booking_id`.
- `total_price` might be considered *derivable* (pricepernight × nights), but storing it for performance is acceptable as long as consistency checks are in place.

### Payment
- Attributes (booking_id, amount, payment_date, method) depend only on `payment_id`.
- `amount` depends directly on `payment_id`, not transitively through booking.

### Review
- Attributes (property_id, user_id, rating, comment) depend only on `review_id`.
- No transitive dependencies.

### Message
- Attributes (sender_id, recipient_id, message_body, sent_at) depend only on `message_id`.
- No transitive dependencies.

---

## Adjustments Made
- Verified that all attributes are dependent only on their table’s primary key.
- Considered `total_price` in Booking: while it is derivable, keeping it is acceptable for query optimization. If strict 3NF is required, it could be removed and calculated dynamically.

---

## Conclusion
The database schema meets the requirements of **Third Normal Form (3NF)**:
- No repeating groups (1NF).
- No partial dependencies (2NF).
- No transitive dependencies (3NF).

📌 **Final Note:** For performance, some denormalization (like keeping `total_price`) may be beneficial in real-world systems.
