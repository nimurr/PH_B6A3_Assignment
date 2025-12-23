# Vehicle Rental System – Database Design & SQL Queries

##  Project Overview
This project is a simplified **Vehicle Rental System** database designed to demonstrate core database concepts such as table design, relationships, and SQL querying.

The system manages:
- Users (Admins and Customers)
- Vehicles (Cars, Bikes, Trucks)
- Bookings (Vehicle rentals by users)

The project focuses on:
- Proper database schema design
- Entity Relationship Diagram (ERD)
- SQL queries using JOIN, EXISTS, WHERE, GROUP BY, and HAVING

---

##  Objectives
By completing this project, the following concepts are demonstrated:

- Designing relational database tables
- Using Primary Keys and Foreign Keys
- Implementing One-to-Many and Many-to-One relationships
- Writing optimized SQL queries
- Understanding real-world business logic

---

##  Database Tables

### 1. Users
Stores user information such as customers and admins.

**Fields:**
- user_id (Primary Key)
- name
- email (Unique)
- phone
- role (Admin / Customer)

---

### 2. Vehicles
Stores all vehicle-related information.

**Fields:**
- vehicle_id (Primary Key)
- name
- type (car, bike, truck)
- model
- registration_number (Unique)
- rental_price
- status (available, rented, maintenance)

---

### 3. Bookings
Stores booking details linking users and vehicles.

**Fields:**
- booking_id (Primary Key)
- user_id (Foreign Key → Users)
- vehicle_id (Foreign Key → Vehicles)
- start_date
- end_date
- status (pending, confirmed, completed, cancelled)
- total_cost

---

## 🔗 Database Relationships
- One User can make many Bookings (One-to-Many)
- One Vehicle can be booked many times (One-to-Many)
- Each Booking is linked to exactly one User and one Vehicle

---

##  Business Rules
- Email must be unique for each user
- Vehicle registration number must be unique
- A booking must be linked to a valid user and vehicle
- Status fields control booking and vehicle availability

---

##  Testing
Sample data has been provided to test all SQL queries.
All queries have been tested using **PostgreSQL**.

---

##  Files Included
- `README.md` → Project documentation
- `Assignment_3.sql` → All SQL queries with solutions
- ERD link (Lucidchart – submitted separately)

---

##  Technologies Used
- PostgreSQL
- SQL
- Lucidchart (for ERD)

---

## 📌 Author
Nimur Rahman Nerob
