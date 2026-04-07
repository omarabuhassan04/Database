# Database — Library Management System

A Library Management System database built with **SQL Server (T-SQL)**. The schema covers core entities including Books, Authors, Members, Staff, Sections, and Transactions. It implements foreign key constraints, check constraints, stored procedures for CRUD operations, and relational mappings between books, authors, and library sections. Designed to manage book borrowing, returns, fines, and staff assignments across library sections.

## Database Schema

| Table | Description |
|-------|-------------|
| `book` | Stores book details (title, category, genres) |
| `auther` | Stores author details (name, age, nationality) |
| `member` | Library members with active/not active status |
| `staff` | Staff members with salary and SSN |
| `section` | Library sections managed by staff |
| `transactions` | Borrowing and return records |
| `transaction_date` | Dates, return deadlines, and fines |
| `book_auther` | Many-to-many: books and authors |
| `book_section` | Maps books to library sections |
| `staff_section` | Maps staff to sections |
| `staff_phone` | Staff contact numbers |

## Stored Procedures

- `add_book` / `update_book` — Insert and update book records
- `add_author` / `update_author` / `delete_author` — Manage author records
- `add_staff` — Add new staff members
- `get_books_by_member` — Retrieve books borrowed by a member
- `get_books_by_author` — Retrieve books written by an author
- `GetBooksByCategory` — Filter books by category
- `ShowStaffBySection` — List staff assigned to a section
- `ShowAuthorNationality` — Display author nationality

## Technologies

`SQL Server` · `T-SQL` · `Stored Procedures` · `Relational Database Design`

## How to Run

1. Open **SQL Server Management Studio (SSMS)**
2. Run `abuhassan.sql` to create the database, tables, and stored procedures

## Repository Structure

```
Database/
├── abuhassan.sql       # Full database schema and stored procedures
├── database med.docx   # Project documentation
├── fina database.docx  # Final report
├── user dec.docx       # User decisions document
└── README.md
```

## Author

**Omar Abuhassan**
