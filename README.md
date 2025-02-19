The library app is written using ruby on rails. It allows users to manage books, track lending histo
ry, and borrow/return books without requiring authentication.

Features:
Manage Books - (CRUD) Create, View, update and delete books
Book lending - Borrow and return Books
Borrowig history - Track borrowings an returns
Borower lookup - view books borrowed by a specifi person

🛠️ Setup Instructions

Prerequisites

Ensure you have the following installed on your system:

    Ruby 3.2.2 (Check with ruby -v)
    Rails 8.0.0 (Check with rails -v)
    SQLite3 (Default database for development)

Clone The repository
git clone https://github.com/xander254/library_app
cd library_app

🛠 Running the App in the Rails Console
1. Start the Rails Console

rails console

2. Add a New Book

To create a book:
 book = Book.create(title: "The Great Gatsby", author: "F. Scott Fitzgerald")

3. List All Books

Book.all

4. Borrow a Book

book = Book.first  # Selects the first book in the database
Borrowing.create(book: book, borrower_name: "Omwami", borrowed_at: Time.now)

5. Return a Book

borrowing = Borrowing.where(book: book, returned_at: nil).first
borrowing.update(returned_at: Time.now)

6. View Borrowing History of a Book

book.borrowings

7. View Borrowing History of a Specific Person

Borrowing.where(borrower_name: "Omwami")

8. Delete a Book

book = Book.find_by(title: "The Great Gatsby")
book.destroy

This lets you manage the library entirely from the console.




