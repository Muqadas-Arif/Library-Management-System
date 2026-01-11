-- 2. CREATE TABLES
-- ============================================

-- Librarians Table
CREATE TABLE Librarians (
    librarian_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    phone NVARCHAR(15),
    hire_date DATE NOT NULL,
    status NVARCHAR(10) DEFAULT 'Active' CHECK (status IN ('Active', 'Inactive'))
);

-- Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    phone NVARCHAR(15),
    address NVARCHAR(200),
    registration_date DATE NOT NULL,
    membership_status NVARCHAR(10) DEFAULT 'Active' 
        CHECK (membership_status IN ('Active', 'Suspended', 'Expired'))
);

-- Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(200) NOT NULL,
    author NVARCHAR(100) NOT NULL,
    isbn NVARCHAR(20) UNIQUE,
    publisher NVARCHAR(100),
    publication_year INT,
    category NVARCHAR(50),
    total_copies INT NOT NULL DEFAULT 1,
    available_copies INT NOT NULL DEFAULT 1,
    CHECK (available_copies >= 0),
    CHECK (available_copies <= total_copies)
);

-- Borrowing (Loans) Table
CREATE TABLE Borrowing (
    borrow_id INT PRIMARY KEY IDENTITY(1,1),
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    librarian_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE NULL,
    status NVARCHAR(10) DEFAULT 'Borrowed' CHECK (status IN ('Borrowed', 'Returned', 'Overdue')),
    CONSTRAINT FK_Borrowing_Books FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    CONSTRAINT FK_Borrowing_Members FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
    CONSTRAINT FK_Borrowing_Librarians FOREIGN KEY (librarian_id) REFERENCES Librarians(librarian_id) ON DELETE CASCADE
);
GO
