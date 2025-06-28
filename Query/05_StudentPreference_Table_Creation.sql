CREATE TABLE StudentPreference (
    StudentId BIGINT,
    SubjectId VARCHAR(20),
    Preference INT,
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId),
    FOREIGN KEY (SubjectId) REFERENCES SubjectDetails(SubjectId),
    CONSTRAINT UQ_Student_Subject UNIQUE (StudentId, SubjectId)
);