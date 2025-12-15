# Task-Management-System
Task Management System built using ASP.NET MVC, ADO.NET, and MS SQL Server. Implements CRUD operations, task status management, search functionality, and date handling using stored procedures with MVC architecture.


▶ How to Run the Project

1. Download the ZIP file.
2. Extract the ZIP file.
3. Open the solution file Project_Task_MS.sln in Visual Studio.
4. Open SQL Server Management Studio (SSMS).
5. Open the database script file TASK_Database.sql from the Database folder.
5. Execute the script to create the database, tables, and stored procedures.


# Task Management System (TMS)

## Project Overview
The Task Management System is a web-based application developed using ASP.NET MVC and MS SQL Server.  
It allows users to create, view, update, delete, and search tasks efficiently with proper status tracking.

This project demonstrates CRUD operations, database relationships, server-side MVC architecture, and AJAX-based interactions.

---

## Technologies Used
- **Backend:** ASP.NET MVC (.NET Framework)
- **Database:** Microsoft SQL Server
- **Data Access:** ADO.NET with Stored Procedures
- **Frontend:** HTML, CSS, JavaScript, jQuery
- **Architecture:** MVC (Model–View–Controller)

---

## Features Implemented
- Create new tasks
- View task list
- Update task details
- Delete tasks
- Search tasks by Title or Description
- Task Status management (Open / Ongoing / Completed)
- Date-only handling (no time shown)

---

## Database Design

### Tables
#### TBL_Status
| Column | Type |
|------|------|
| StatusID | INT (PK) |
| StatusName | NVARCHAR(50) |

#### TBL_TASK
| Column | Type |
|------|------|
| TaskID | INT (PK, Identity) |
| TaskTitle | NVARCHAR(200) |
| TaskDescription | NVARCHAR(500) |
| TaskDueDate | DATE |
| TaskStatus | INT |
| TaskRemarks | NVARCHAR(300) |
| CreatedOn | DATE |
| CreatedBy | NVARCHAR(200) |
| LastUpdatedOn | DATE |
| LastUpdatedBy | NVARCHAR(200) |

---

## Stored Procedures Used
- `GET_STATUS`
- `TASK_Create`
- `TASK_Show`
- `TASK_Edit`
- `TASK_Update`
- `TASK_Delete`
- `TASK_Search`

---

## Application Flow
1. User interacts with View (HTML + jQuery)
2. AJAX request sent to Controller
3. Controller calls Stored Procedure via ADO.NET
4. Data returned as JSON
5. UI updated dynamically

---

## Build & Run Instructions
1. Clone the repository
2. Open solution in Visual Studio
3. Run SQL scripts in SQL Server
4. Update connection string
5. Press **F5** to run the project

---

## Screenshots
Screenshot are available in the Zip File

---

## Author
Developed as an entry-level assignment using ASP.NET MVC.
