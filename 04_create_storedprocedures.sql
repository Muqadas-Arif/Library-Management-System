-- ============================================
-- 5. STORED PROCEDURE - BORROW BOOK
-- ============================================

CREATE PROCEDURE sp_BorrowBook
    @book_id INT,
    @member_id INT,
    @librarian_id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @available_copies INT;
    DECLARE @error_message NVARCHAR(500);
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Check if book exists and get available copies
        SELECT @available_copies = available_copies 
        FROM Books 
        WHERE book_id = @book_id;
        
        IF @available_copies IS NULL
        BEGIN
            SET @error_message = 'Book ID ' + CAST(@book_id AS NVARCHAR(10)) + ' does not exist.';
            THROW 50001, @error_message, 1;
        END
        
        IF @available_copies <= 0
        BEGIN
            SET @error_message = 'Book is not available for borrowing.';
            THROW 50002, @error_message, 1;
        END
        
        -- Insert borrowing record
        INSERT INTO Borrowing (book_id, member_id, librarian_id, borrow_date, due_date, status)
        VALUES (@book_id, @member_id, @librarian_id, CAST(GETDATE() AS DATE), DATEADD(DAY, 14, CAST(GETDATE() AS DATE)), 'Borrowed');
        
        -- Update book availability
        UPDATE Books
        SET available_copies = available_copies - 1
        WHERE book_id = @book_id;
        
        COMMIT TRANSACTION;
        
        PRINT 'Book borrowed successfully. Due date: ' + CONVERT(NVARCHAR(20), DATEADD(DAY, 14, GETDATE()), 101);
        
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        PRINT 'Error: ' + ERROR_MESSAGE();
        THROW;
    END CATCH
END;
GO

-- Test: Borrow a book
EXEC sp_BorrowBook @book_id = 1, @member_id = 1, @librarian_id = 1;
EXEC sp_BorrowBook @book_id = 4, @member_id = 2, @librarian_id = 2;
EXEC sp_BorrowBook @book_id = 5, @member_id = 3, @librarian_id = 1;
GO
