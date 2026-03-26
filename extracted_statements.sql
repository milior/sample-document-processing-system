-- =====================================================================
-- EXTRACTED SQL STATEMENTS CATALOG
-- Application: DocumentProcessor.Web
-- Source Database: Microsoft SQL Server (DPS, version 2019)
-- Target Database: PostgreSQL 13
-- Extraction Method: Implicit EF Core LINQ operations reconstructed
--   as the equivalent MS SQL Server statements
-- Extraction Date: 2026-03-26
-- =====================================================================

-- =====================================================================
-- Statement 1: SELECT by Primary Key (FindAsync)
-- Source File: Services/DocumentProcessingService.cs
-- Line: 16
-- EF Core Operation: db.Documents.FindAsync(documentId)
-- Description: Retrieves a single document by its primary key (Guid)
-- =====================================================================
SELECT Id, FileName, OriginalFileName, FileExtension, FileSize, ContentType, StoragePath, Status, Summary, UploadedBy, IsDeleted
FROM dbo.Documents
WHERE Id = @p0;

-- =====================================================================
-- Statement 2: SELECT with TOP (Where/Take/ToListAsync)
-- Source File: Components/Pages/Home.razor
-- Line: LoadDocuments method (~line 155)
-- EF Core Operation: DB.Documents.Where(d => !d.IsDeleted).Take(50).ToListAsync()
-- Description: Retrieves top 50 non-deleted documents
-- Note: EF Core global query filter adds IsDeleted = 0 condition
-- =====================================================================
SELECT TOP(50) Id, FileName, OriginalFileName, FileExtension, FileSize, ContentType, StoragePath, Status, Summary, UploadedBy, IsDeleted
FROM dbo.Documents
WHERE IsDeleted = 0;

-- =====================================================================
-- Statement 3: INSERT (AddAsync + SaveChangesAsync)
-- Source File: Components/Pages/Home.razor
-- Line: UploadFiles method (~line 175)
-- EF Core Operation: DB.Documents.AddAsync(doc) + DB.SaveChangesAsync()
-- Description: Inserts a new document record
-- =====================================================================
INSERT INTO dbo.Documents (Id, FileName, OriginalFileName, FileExtension, FileSize, ContentType, StoragePath, Status, Summary, UploadedBy, IsDeleted)
VALUES (@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9, @p10);

-- =====================================================================
-- Statement 4: UPDATE Status (property set + SaveChangesAsync)
-- Source File: Services/DocumentProcessingService.cs
-- Line: 20
-- EF Core Operation: doc.Status = DocumentStatus.Processing; await db.SaveChangesAsync();
-- Description: Updates document status to Processing (also used for Failed status)
-- =====================================================================
UPDATE dbo.Documents
SET Status = @p0
WHERE Id = @p1;

-- =====================================================================
-- Statement 5: UPDATE Status + Summary (property set + SaveChangesAsync)
-- Source File: Services/DocumentProcessingService.cs
-- Line: 28-29
-- EF Core Operation: doc.Status = DocumentStatus.Processed; doc.Summary = summary.Summary; await db.SaveChangesAsync();
-- Description: Updates document status and summary after processing
-- =====================================================================
UPDATE dbo.Documents
SET Status = @p0, Summary = @p1
WHERE Id = @p2;

-- =====================================================================
-- Statement 6: DELETE (Remove + SaveChangesAsync)
-- Source File: Components/Pages/Home.razor
-- Line: DeleteDoc method (~line 192)
-- EF Core Operation: DB.Documents.Remove(_deleteDoc); await DB.SaveChangesAsync();
-- Description: Deletes a document record
-- =====================================================================
DELETE FROM dbo.Documents
WHERE Id = @p0;

-- =====================================================================
-- Statement 7: CREATE TABLE (EnsureCreatedAsync)
-- Source File: Program.cs
-- Line: ~68
-- EF Core Operation: Database.EnsureCreatedAsync()
-- Description: Creates the Documents table if it doesn't exist
-- Column types based on Document.cs model and SQL Server type mappings
-- =====================================================================
CREATE TABLE dbo.Documents (
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    FileName NVARCHAR(MAX) NOT NULL,
    OriginalFileName NVARCHAR(MAX) NOT NULL,
    FileExtension NVARCHAR(MAX) NOT NULL,
    FileSize BIGINT NOT NULL,
    ContentType NVARCHAR(MAX) NOT NULL,
    StoragePath NVARCHAR(MAX) NOT NULL,
    Status INT NOT NULL,
    Summary NVARCHAR(MAX) NULL,
    UploadedBy NVARCHAR(MAX) NOT NULL,
    IsDeleted BIT NOT NULL DEFAULT 0
);
