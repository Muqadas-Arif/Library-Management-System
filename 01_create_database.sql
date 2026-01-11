
-- ============================================
-- LIBRARY MANAGEMENT SYSTEM - MS SQL SERVER
-- Complete Implementation with Database Creation
-- ============================================

-- ===========================================
-- 1. CREATE DATABASE
-- ============================================

-- Check if database exists and drop it
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'LibraryManagementDB')
BEGIN
    ALTER DATABASE LibraryManagementDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE LibraryManagementDB;
END
GO
                              -- Create the database
CREATE DATABASE LibraryManagementDB;
GO

-- Use the database
USE LibraryManagementDB;
GO

