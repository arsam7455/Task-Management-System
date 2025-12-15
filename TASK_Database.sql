CREATE DATABASE TASK_MANAGEMENT_SYSTEM
USE TASK_MANAGEMENT_SYSTEM

============================
CREATE TABLE TBL_Status
(
StatusID INT PRIMARY KEY,
StatusName NVARCHAR(50) NOT NULL
);

INSERT INTO TBL_Status VALUES (1, 'Open');
INSERT INTO TBL_Status VALUES (2, 'Ongoing');
INSERT INTO TBL_Status VALUES (3, 'Completed');
=============================

CREATE PROCEDURE GET_STATUS
AS
BEGIN
SELECT * FROM TBL_Status
END;
=============================

CREATE TABLE TBL_TASK
(
TaskID INT PRIMARY KEY IDENTITY, 
TaskTitle NVARCHAR(200) NOT NULL,
TaskDescription NVARCHAR(500),
TaskDueDate DATE, 
TaskStatus INT NOT NULL, 
TaskRemarks NVARCHAR(300),

CreatedOn DATE,
CreatedBy NVARCHAR(200) NOT NULL,

LastUpdatedOn DATE,
LastUpdatedBy NVARCHAR(200) DEFAULT NULL,
);
=============================

CREATE PROCEDURE TASK_Create
(
@TaskTitle NVARCHAR(200),
@TaskDescription NVARCHAR(500),
@TaskDueDate DATE,
@TaskStatus INT,
@TaskRemarks NVARCHAR(300),
@CreatedOn DATE,
@CreatedBy NVARCHAR(200),
@LastUpdatedOn DATE,
@LastUpdatedBy NVARCHAR(200)
)
AS
BEGIN
INSERT INTO TBL_TASK(TaskTitle,TaskDescription,TaskDueDate,TaskStatus,TaskRemarks,CreatedOn,CreatedBy,LastUpdatedOn,LastUpdatedBy) 
VALUES(@TaskTitle,@TaskDescription,@TaskDueDate,@TaskStatus,@TaskRemarks,@CreatedOn,@CreatedBy,@LastUpdatedOn,@LastUpdatedBy);
END;
=============================

CREATE PROCEDURE TASK_Show
AS
BEGIN 
SELECT * FROM TBL_TASK 
join TBL_Status ON TaskStatus = StatusID
ORDER BY TaskID DESC;
END;
=============================

CREATE PROCEDURE TASK_Delete
(
@TaskID INT
)
AS
BEGIN
DELETE FROM TBL_TASK WHERE TaskID = @TaskID;
END;
=============================

CREATE PROCEDURE TASK_Edit
(
@TaskID INT
)
AS
BEGIN
SELECT * FROM TBL_TASK WHERE TaskID = @TaskID;
END;
=============================

CREATE PROCEDURE TASK_Update
(
@TaskID INT,
@TaskTitle NVARCHAR(200),
@TaskDescription NVARCHAR(500),
@TaskDueDate DATE,
@TaskStatus INT,
@TaskRemarks NVARCHAR(300),
@CreatedOn DATE,
@CreatedBy NVARCHAR(200),
@LastUpdatedOn DATE,
@LastUpdatedBy NVARCHAR(200)
)
AS
BEGIN
UPDATE TBL_TASK SET TaskTitle = @TaskTitle, TaskDescription = @TaskDescription, TaskDueDate = @TaskDueDate, TaskStatus = @TaskStatus, TaskRemarks = @TaskRemarks, CreatedOn = @CreatedOn, CreatedBy = @CreatedBy, LastUpdatedOn = @LastUpdatedOn, LastUpdatedBy = @LastUpdatedBy 
WHERE TaskID = @TaskID;
END;
=============================

CREATE PROCEDURE TASK_Search
(
    @key NVARCHAR(200),
    @column INT
)
AS
BEGIN
IF (@column = 1)
BEGIN
SELECT * FROM TBL_TASK WHERE TaskTitle LIKE '%' + @key + '%';
END

IF (@column = 2)
BEGIN
SELECT * FROM TBL_TASK WHERE TaskDescription LIKE '%' + @key + '%';
END
END;
=============================
