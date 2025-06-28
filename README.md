
# 🎓 Open Elective Subject Allocation System (SQL Project)

This project implements an **automated subject allocation system** for students based on their GPA and subject preferences. It ensures fair and optimized distribution of elective subjects, considering seat availability and student priorities.

---

## 📌 Objective

To develop a SQL-based system where:
- Each student submits 5 elective subject preferences.
- Subjects are allotted based on **descending GPA**.
- If a subject is full, the next preference is checked.
- If none are available, the student is marked as **unallotted**.

---

## 🛠️ Tech Stack

| Technology | Purpose               |
|------------|------------------------|
| SQL Server | Database & procedures |
| T-SQL      | Logic implementation   |

---

## 📊 Database Schema

| Table Name         | Columns                                     | Description                                                                 |
|--------------------|---------------------------------------------|-----------------------------------------------------------------------------|
| `StudentDetails`   | `StudentId`, `StudentName`, `GPA`, `Branch`, `Section` | Contains student academic info                                              |
| `SubjectDetails`   | `SubjectId`, `SubjectName`, `MaxSeats`, `RemainingSeats` | Stores all elective subject details and seat availability                   |
| `StudentPreference`| `StudentId`, `SubjectId`, `Preference`      | Maps students to their 5 subject preferences (1 = highest priority)         |
| `Allotments`       | `SubjectId`, `StudentId`                    | Final allotted subject for each student                                     |
| `UnallotedStudents`| `StudentId`                                 | Students who couldn't be allotted any subject from their preference list    |

---

## 🚀 Setup Instructions

1. **Create the schema**  
   Execute the SQL scripts in the following order:
   - `CREATE TABLE` statements for all 5 tables
   - `INSERT INTO` statements for student/subject/preference data

2. **Create stored procedure**  
   Run `AllocateOpenElectives` procedure code.

3. **Execute allocation**  
   ```sql
   EXEC AllocateOpenElectives;
   ```

4. **View results**
   ```sql
   SELECT * FROM Allotments;
   SELECT * FROM UnallotedStudents;
   ```

---

## ⚙️ Allocation Logic

1. Sort all students by **GPA descending**.
2. For each student:
   - Check their subject preferences one by one (1 to 5).
   - If a subject has available seats:
     - Allot that subject.
     - Decrease its `RemainingSeats`.
   - If all preferences are full, mark student as **unallotted**.

---

## 📥 Sample Output

### ✅ Allotted Students

| SubjectId | StudentId   |
|-----------|-------------|
| PO1491    | 159103041   |
| PO1491    | 159103036   |
| PO1492    | 159103039   |
| PO1492    | 159103038   |
| PO1492    | 159103040   |
| PO1492    | 159103037   |

### ❌ Unallotted Students

> (Empty if all got subjects — populated if some couldn’t be allotted any)

---

## 📁 Files/Folders in This Repo

| File/Folders                           | Description                                 |
|----------------------------------------|---------------------------------------------|
| `Queries`                              | All Sql commands/queries                    |
| `Output`                               | Output of all Sql queries/commands          |
| `Student Allotment SQL Problem.pdf`    | The `Problem Statement` for the Week 4      |
| `README.md`                            | This documentation                          |

---

## 👨‍💻 Developed By

**Aniruddha Sarkar**  
_Student, B.Tech CSE (Cyber Security)_  
_Techno Main Salt Lake_
