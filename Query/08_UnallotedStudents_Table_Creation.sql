CREATE TABLE UnallotedStudents (
    StudentId BIGINT PRIMARY KEY,
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId)
);