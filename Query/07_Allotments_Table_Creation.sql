CREATE TABLE Allotments (
    SubjectId VARCHAR(20),
    StudentId BIGINT,
    FOREIGN KEY (SubjectId) REFERENCES SubjectDetails(SubjectId),
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId)
);
