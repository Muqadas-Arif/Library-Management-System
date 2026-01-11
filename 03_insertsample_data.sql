-- ============================================
-- 3. INSERT SAMPLE DATA
-- ============================================

-- Insert Librarians
INSERT INTO Librarians (first_name, last_name, email, phone, hire_date, status) VALUES
('Sarah', 'Johnson', 'sarah.johnson@library.com', '555-0101', '2020-01-15', 'Active'),
('Michael', 'Chen', 'michael.chen@library.com', '555-0102', '2019-06-20', 'Active'),
('Emily', 'Rodriguez', 'emily.rodriguez@library.com', '555-0103', '2021-03-10', 'Active');

-- Insert Members
INSERT INTO Members (first_name, last_name, email, phone, address, registration_date, membership_status) VALUES
('John', 'Smith', 'john.smith@email.com', '555-1001', '123 Main St, City', '2023-01-10', 'Active'),
('Emma', 'Wilson', 'emma.wilson@email.com', '555-1002', '456 Oak Ave, City', '2023-02-15', 'Active'),
('David', 'Brown', 'david.brown@email.com', '555-1003', '789 Pine Rd, City', '2023-03-20', 'Active'),
('Lisa', 'Anderson', 'lisa.anderson@email.com', '555-1004', '321 Elm St, City', '2023-04-25', 'Active'),
('James', 'Taylor', 'james.taylor@email.com', '555-1005', '654 Maple Dr, City', '2023-05-30', 'Active');

-- Insert Books
INSERT INTO Books (title, author, isbn, publisher, publication_year, category, total_copies, available_copies) VALUES
('To Kill a Mockingbird', 'Harper Lee', '978-0-06-112008-4', 'Harper Perennial', 1960, 'Fiction', 3, 3),
('1984', 'George Orwell', '978-0-452-28423-4', 'Signet Classic', 1949, 'Fiction', 2, 2),
('The Great Gatsby', 'F. Scott Fitzgerald', '978-0-7432-7356-5', 'Scribner', 1925, 'Fiction', 2, 2),
('Clean Code', 'Robert Martin', '978-0-13-235088-4', 'Prentice Hall', 2008, 'Technology', 4, 4),
('Sapiens', 'Yuval Noah Harari', '978-0-06-231609-7', 'Harper', 2015, 'History', 3, 3),
('The Catcher in the Rye', 'J.D. Salinger', '978-0-316-76948-0', 'Little Brown', 1951, 'Fiction', 2, 2),
('Introduction to Algorithms', 'Thomas Cormen', '978-0-262-03384-8', 'MIT Press', 2009, 'Technology', 3, 3),
('Pride and Prejudice', 'Jane Austen', '978-0-14-143951-8', 'Penguin Classics', 1813, 'Fiction', 2, 2);
GO


-- 4. CORE FUNCTIONALITIES - ADD RECORDS
-- ============================================

-- Query 4.1: Add a new book to the library
INSERT INTO Books (title, author, isbn, publisher, publication_year, category, total_copies, available_copies)
VALUES ('The Hobbit', 'J.R.R. Tolkien', '978-0-547-92822-7', 'Mariner Books', 1937, 'Fiction', 2, 2);

-- Query 4.2: Add a new member
INSERT INTO Members (first_name, last_name, email, phone, address, registration_date, membership_status)
VALUES ('Alice', 'Cooper', 'alice.cooper@email.com', '555-1006', '987 Cedar Ln, City', CAST(GETDATE() AS DATE), 'Active');

-- Query 4.3: Add a new librarian
INSERT INTO Librarians (first_name, last_name, email, phone, hire_date, status)
VALUES ('Robert', 'Williams', 'robert.williams@library.com', '555-0104', CAST(GETDATE() AS DATE), 'Active');
GO


