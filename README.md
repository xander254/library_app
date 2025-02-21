
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
  book = Book.create(title: "Atomic Habits", author: "James Clear")

  #create multiple books at once
  Book.create([
  {title: "The Alchemist", author: "Paulo Coelho"},
  {title: "Thinking, Fast and Slow", author: "Daniel Kahneman"}
])
``` 
List All Books
```bash
  # Get all books
  all_books = Book.all

  # Find a book by ID
  specific_book = Book.find(1)

  # Find a book by title
  book_by_title = Book.find_by(title: "Atomic Habits")

  #  Find books by author
   books_by_author = Book.where(author: "James Clear")
```
Updating a Book
```bash
  book = Book.find_by(title: "Atomic Habits")
  book.update(title: "Atomic Habits: Tiny Changes, Remarkable Results")
```
Return a Book
```bash
  book = Book.find_by(title: "The Alchemist")

  borrowing = Borrowing.where(book: book, returned_at: nil).first

  # Update the returned_at timestamp
   borrowing.update(returned_at: Time.now)
```  
View Borrowing History of a Book
```bash
  book = Book.find_by(title: "The Alchemist")
  # all borrowings of a specific book....first query + the next query
  book.borrowings

  #by a specific person
  Borrowing.where(borrower_name: "William Ongeri")
  
  # View active (unreturned) borrowings
  Borrowing.where(returned_at: nil)
``` 
Delete a Book
```bash
  Book.find_by(title: "Atomic Habits") book.destroy
```
Exiting the Console
```bash
  exit
```

This lets you manage the library entirely from the console.
