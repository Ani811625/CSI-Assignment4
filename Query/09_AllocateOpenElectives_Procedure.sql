ALTER PROCEDURE AllocateOpenElectives
AS
BEGIN
    SET NOCOUNT ON;

    
    DELETE FROM Allotments;
    DELETE FROM UnallotedStudents;

    DECLARE @StudentId BIGINT;
    DECLARE @SubjectId VARCHAR(20);
    DECLARE @RemainingSeats INT;
    DECLARE @Allocated BIT;

    
    DECLARE StudentCursor CURSOR FOR
        SELECT StudentId
        FROM StudentDetails
        ORDER BY GPA DESC;

    OPEN StudentCursor;
    FETCH NEXT FROM StudentCursor INTO @StudentId;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @Allocated = 0;

        
        DECLARE PreferenceCursor CURSOR FOR
            SELECT SubjectId
            FROM StudentPreference
            WHERE StudentId = @StudentId
            ORDER BY Preference;

        OPEN PreferenceCursor;
        FETCH NEXT FROM PreferenceCursor INTO @SubjectId;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            SELECT @RemainingSeats = RemainingSeats
            FROM SubjectDetails
            WHERE SubjectId = @SubjectId;

            IF @RemainingSeats > 0
            BEGIN
                INSERT INTO Allotments (SubjectId, StudentId)
                VALUES (@SubjectId, @StudentId);

                UPDATE SubjectDetails
                SET RemainingSeats = RemainingSeats - 1
                WHERE SubjectId = @SubjectId;

                SET @Allocated = 1;
                BREAK;
            END

            FETCH NEXT FROM PreferenceCursor INTO @SubjectId;
        END

        CLOSE PreferenceCursor;
        DEALLOCATE PreferenceCursor;

        IF @Allocated = 0
        BEGIN
            INSERT INTO UnallotedStudents (StudentId)
            VALUES (@StudentId);
        END

        FETCH NEXT FROM StudentCursor INTO @StudentId;
    END

    CLOSE StudentCursor;
    DEALLOCATE StudentCursor;

    PRINT 'Allotment process completed.';
END;
