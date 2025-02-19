
# Library Management 

The library app is written using ruby on rails. It allows users to manage books, track lending histo ry, and borrow/return books without requiring authentication.


## Features

- Manage Books - (CRUD) Create, View, update and delete books
- Book lending - Borrow and return
- Books Borrowig history - Track borrowings an returns
- Borower lookup - view books borrowed by a specifi person


## Setup Instructions

Prerequisites

Ensure you have the following installed on your system:

```bash
Ruby 3.2.2 (Check with ruby -v)
Rails 8.0.0 (Check with rails -v)
SQLite3 (Default database for development)
```

Clone the repository
```bash
  git clone https://github.com/xander254/library_app
  cd library_app
```
Start the Rails Console
(Shortcut: rails c)
```bash
  rails console
```
Add a New Book
```bash
  book = Book.create(title: "Atomic Habbits", author: "James Clear")
``` 
List All Books
```bash
  book = Book.first # Selects the first book in the database
  Borrowing.create(book: book, borrower_name: "Omwami", borrowed_at: Time.now)
```
Return a Book
```bash
  Borrowing.where(book: book, returned_at: nil).first borrowing.update(returned_at: Time.now)
```  
View Borrowing History of a Book
```bash
  book.borrowings
``` 
View Borrowing History of a Specific Person
```bash
  Borrowing.where(borrower_name: "Omwami")
```
Delete a Book
```bash
  Book.find_by(title: "Atomic Habbits") book.destroy
```
This lets you manage the library entirely from the console.
