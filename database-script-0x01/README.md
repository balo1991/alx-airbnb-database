# Airbnb Database Schema

## Overview
This schema defines the relational database structure for an **Airbnb-like system**, covering users, properties, bookings, payments, reviews, and messaging.

## Entities
- **Users**: Stores guest, host, and admin details.
- **Properties**: Listings created by hosts.
- **Bookings**: Reservations made by guests for properties.
- **Payments**: Records of payments linked to bookings.
- **Reviews**: User-submitted reviews of properties.
- **Messages**: Communication between users.

## Constraints & Features
- **Primary Keys**: Each entity uses a UUID.
- **Foreign Keys**:
  - `properties.host_id → users.user_id`
  - `bookings.property_id → properties.property_id`
  - `bookings.user_id → users.user_id`
  - `payments.booking_id → bookings.booking_id`
  - `reviews.property_id → properties.property_id`
  - `reviews.user_id → users.user_id`
  - `messages.sender_id → users.user_id`
  - `messages.recipient_id → users.user_id`
- **Unique Constraints**:
  - `users.email`
- **Check Constraints**:
  - `reviews.rating BETWEEN 1 AND 5`
- **Indexes**:
  - `users.email`
  - Foreign key fields (`property_id`, `user_id`, `booking_id`, `sender_id`, `recipient_id`)

## Normalization
The schema follows **Third Normal Form (3NF)**:
- No repeating groups.
- No partial dependencies.
- No transitive dependencies.

## Usage
Run the schema creation script in a supported SQL database:

```bash
psql -U <username> -d <database> -f schema.sql
