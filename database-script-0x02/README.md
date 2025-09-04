# Airbnb Sample Data

## Overview
This directory contains SQL scripts for populating the **Airbnb-style database** with sample data.  
The data reflects realistic use cases, including multiple users, hosts, properties, bookings, payments, reviews, and messages.

## Files
- **sample_data.sql**  
  Populates the database with sample records to test functionality and queries.

- **README.md**  
  Documentation for the sample data script.

## Sample Data Included
- **Users**  
  - Guest, Host, Admin roles  
  - Unique emails and phone numbers  

- **Properties**  
  - Hosted by users with role = host  
  - Includes names, descriptions, locations, and nightly prices  

- **Bookings**  
  - Reservations linked to properties and users  
  - Includes confirmed and pending statuses  

- **Payments**  
  - Linked to bookings  
  - Supports multiple methods (credit card, PayPal, Stripe)  
  - Includes partial and full payments  

- **Reviews**  
  - Ratings (1–5) and comments linked to properties and users  

- **Messages**  
  - Guest-host conversations  

## Usage
Ensure that the schema has been created first (`schema.sql`) before inserting sample data.

### PostgreSQL
```bash
psql -U <username> -d <database> -f sample_data.sql
```

### MySQL
```bash
mysql -u <username> -p <database> < sample_data.sql
```

## Notes
- UUIDs are used as unique identifiers for all records.  
- The data is for **testing and development purposes only**, not production.  
