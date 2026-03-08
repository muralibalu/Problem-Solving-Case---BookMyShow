# Problem-Solving-Case---BookMyShow
# BookMyShow Database Design Assignment

## Problem Statement

Design the database schema for a movie ticket booking platform similar to BookMyShow.

For a given theatre:

* The platform displays the next 7 available dates.
* When a date is selected, all movies running in that theatre along with their show timings are displayed.

The task is to:

1. Identify entities and attributes.
2. Design normalized database tables (1NF, 2NF, 3NF, BCNF).
3. Provide SQL queries to create tables and insert sample data.
4. Write a query to fetch shows for a given theatre and date.

---

# Entities and Tables

## 1. Theatre

Represents a cinema theatre.

Attributes:

* theatre_id (Primary Key)
* theatre_name
* location

Example Row:

| theatre_id | theatre_name | location |
| ---------- | ------------ | -------- |
| 1          | PVR Nexus    | Chennai  |

---

## 2. Screen

Each theatre contains multiple screens.

Attributes:

* screen_id (Primary Key)
* theatre_id (Foreign Key)
* screen_name
* total_seats

Example Row:

| screen_id | theatre_id | screen_name | total_seats |
| --------- | ---------- | ----------- | ----------- |
| 1         | 1          | Screen 1    | 200         |

---

## 3. Movie

Stores movie information.

Attributes:

* movie_id (Primary Key)
* movie_name
* language
* duration

Example Row:

| movie_id | movie_name | language | duration |
| -------- | ---------- | -------- | -------- |
| 1        | Dasara     | Telugu   | 156      |

---

## 4. Show

Represents a movie playing on a screen on a particular date.

Attributes:

* show_id (Primary Key)
* movie_id (Foreign Key)
* screen_id (Foreign Key)
* show_date

Example Row:

| show_id | movie_id | screen_id | show_date  |
| ------- | -------- | --------- | ---------- |
| 1       | 1        | 1         | 2026-03-25 |

---

## 5. Show_Timing

Stores show timings for each show.

Attributes:

* timing_id (Primary Key)
* show_id (Foreign Key)
* show_time

Example Row:

| timing_id | show_id | show_time |
| --------- | ------- | --------- |
| 1         | 1       | 12:15     |

---

# Normalization

### First Normal Form (1NF)

* All attributes contain atomic values.
* No repeating groups.

### Second Normal Form (2NF)

* All non-key attributes depend on the full primary key.

### Third Normal Form (3NF)

* No transitive dependencies.

### Boyce-Codd Normal Form (BCNF)

* Every determinant is a candidate key.

All designed tables satisfy BCNF.

---

# Query (P2)

List all shows for a given theatre on a specific date.

Example: Shows in **PVR Nexus on 25 March 2026**

```sql
SELECT 
    m.movie_name,
    s.show_date,
    st.show_time,
    sc.screen_name,
    t.theatre_name
FROM Show s
JOIN Movie m ON s.movie_id = m.movie_id
JOIN Screen sc ON s.screen_id = sc.screen_id
JOIN Theatre t ON sc.theatre_id = t.theatre_id
JOIN Show_Timing st ON s.show_id = st.show_id
WHERE s.show_date = '2026-03-25'
AND t.theatre_name = 'PVR Nexus';
```
