-- =====================================================================
-- CONVERTED SQL STATEMENTS CATALOG (PostgreSQL)
-- Application: DocumentProcessor.Web
-- Source Database: Microsoft SQL Server (DPS, version 2019)
-- Target Database: PostgreSQL 13
-- DMS Migration Project: arn:aws:dms:us-east-1:897601484648:migration-project:MWELFG3TF5B5VI5TFIFKYZ5PEA
-- Schema Mapping: dbo.Documents -> dps_dbo.documents (confirmed via DMS schema mapping)
-- =====================================================================
-- NOTE: All 7 statements were passed through the DMS MCP tool.
-- All 7 returned converted_sql_count=0 with message "No converted SQL found in target metadata models".
-- Manual conversion applied with lowercase schema mapping per DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA rules.
-- =====================================================================

-- =====================================================================
-- Statement 1: SELECT by Primary Key (FindAsync)
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- DMS Failure Reason: converted_sql_count=0, "No converted SQL found in target metadata models"
-- DMS Timestamp: 2026-03-26T11:20:17.986602
-- Changes: dbo.Documents -> dps_dbo.documents, all column names lowercased
-- =====================================================================
-- Original: SELECT Id, FileName, OriginalFileName, FileExtension, FileSize, ContentType, StoragePath, Status, Summary, UploadedBy, IsDeleted FROM dbo.Documents WHERE Id = @p0;
SELECT id, filename, originalfilename, fileextension, filesize, contenttype, storagepath, status, summary, uploadedby, isdeleted
FROM dps_dbo.documents
WHERE id = @p0;

-- =====================================================================
-- Statement 2: SELECT with LIMIT (Where/Take/ToListAsync)
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- DMS Failure Reason: converted_sql_count=0, "No converted SQL found in target metadata models"
-- DMS Timestamp: 2026-03-26T11:20:56.232011
-- Changes: dbo.Documents -> dps_dbo.documents, TOP(50) -> LIMIT 50, all column names lowercased
-- =====================================================================
-- Original: SELECT TOP(50) Id, FileName, OriginalFileName, FileExtension, FileSize, ContentType, StoragePath, Status, Summary, UploadedBy, IsDeleted FROM dbo.Documents WHERE IsDeleted = 0;
SELECT id, filename, originalfilename, fileextension, filesize, contenttype, storagepath, status, summary, uploadedby, isdeleted
FROM dps_dbo.documents
WHERE isdeleted = 0
LIMIT 50;

-- =====================================================================
-- Statement 3: INSERT (AddAsync + SaveChangesAsync)
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- DMS Failure Reason: converted_sql_count=0, "No converted SQL found in target metadata models"
-- DMS Timestamp: 2026-03-26T11:21:33.751732
-- Changes: dbo.Documents -> dps_dbo.documents, all column names lowercased
-- =====================================================================
-- Original: INSERT INTO dbo.Documents (Id, FileName, OriginalFileName, FileExtension, FileSize, ContentType, StoragePath, Status, Summary, UploadedBy, IsDeleted) VALUES (@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9, @p10);
INSERT INTO dps_dbo.documents (id, filename, originalfilename, fileextension, filesize, contenttype, storagepath, status, summary, uploadedby, isdeleted)
VALUES (@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9, @p10);

-- =====================================================================
-- Statement 4: UPDATE Status (property set + SaveChangesAsync)
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- DMS Failure Reason: converted_sql_count=0, "No converted SQL found in target metadata models"
-- DMS Timestamp: 2026-03-26T11:22:11.003176
-- Changes: dbo.Documents -> dps_dbo.documents, all column names lowercased
-- =====================================================================
-- Original: UPDATE dbo.Documents SET Status = @p0 WHERE Id = @p1;
UPDATE dps_dbo.documents
SET status = @p0
WHERE id = @p1;

-- =====================================================================
-- Statement 5: UPDATE Status + Summary (property set + SaveChangesAsync)
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- DMS Failure Reason: converted_sql_count=0, "No converted SQL found in target metadata models"
-- DMS Timestamp: 2026-03-26T11:22:49.810545
-- Changes: dbo.Documents -> dps_dbo.documents, all column names lowercased
-- =====================================================================
-- Original: UPDATE dbo.Documents SET Status = @p0, Summary = @p1 WHERE Id = @p2;
UPDATE dps_dbo.documents
SET status = @p0, summary = @p1
WHERE id = @p2;

-- =====================================================================
-- Statement 6: DELETE (Remove + SaveChangesAsync)
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- DMS Failure Reason: converted_sql_count=0, "No converted SQL found in target metadata models"
-- DMS Timestamp: 2026-03-26T11:23:27.210877
-- Changes: dbo.Documents -> dps_dbo.documents, all column names lowercased
-- =====================================================================
-- Original: DELETE FROM dbo.Documents WHERE Id = @p0;
DELETE FROM dps_dbo.documents
WHERE id = @p0;

-- =====================================================================
-- Statement 7: CREATE TABLE (EnsureCreatedAsync)
-- Conversion Method: DMS_FAILURE_MANUAL_CONVERSION_WITH_LOWERCASE_SCHEMA
-- DMS Failure Reason: converted_sql_count=0, "No converted SQL found in target metadata models"
-- DMS Timestamp: 2026-03-26T11:24:07.979926
-- Changes: dbo.Documents -> dps_dbo.documents, all column/table names lowercased,
--   UNIQUEIDENTIFIER -> UUID, NVARCHAR(MAX) -> TEXT, INT -> INTEGER, BIT -> SMALLINT
-- =====================================================================
-- Original: CREATE TABLE dbo.Documents (Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, FileName NVARCHAR(MAX) NOT NULL, OriginalFileName NVARCHAR(MAX) NOT NULL, FileExtension NVARCHAR(MAX) NOT NULL, FileSize BIGINT NOT NULL, ContentType NVARCHAR(MAX) NOT NULL, StoragePath NVARCHAR(MAX) NOT NULL, Status INT NOT NULL, Summary NVARCHAR(MAX) NULL, UploadedBy NVARCHAR(MAX) NOT NULL, IsDeleted BIT NOT NULL DEFAULT 0);
CREATE TABLE dps_dbo.documents (
    id UUID NOT NULL PRIMARY KEY,
    filename TEXT NOT NULL,
    originalfilename TEXT NOT NULL,
    fileextension TEXT NOT NULL,
    filesize BIGINT NOT NULL,
    contenttype TEXT NOT NULL,
    storagepath TEXT NOT NULL,
    status INTEGER NOT NULL,
    summary TEXT NULL,
    uploadedby TEXT NOT NULL,
    isdeleted SMALLINT NOT NULL DEFAULT 0
);
