	/* Final Project Procedures 
	-- Retrieves and displays data
USE myVideoGameCollection;
GO
CREATE PROC spRating
AS
SELECT * FROM Personal
ORDER BY PersonalRating;
GO

EXEC spRating;

-- Takes an input parameter
USE myVideoGameCollection;
GO
CREATE PROC spGetPlayThroughs
	@PlayThroughs int
AS
BEGIN
	SELECT * FROM Personal
	WHERE PlayThroughs = @PlayThroughs;
END
GO
EXEC spGetPlayThroughs 1

-- Takes one input parameter and returns three output parameters
USE myVideoGameCollection;
GO
CREATE PROC spMainInfo
	@GameID int,
	@GameName nvarchar(30) OUTPUT,
	@Genre nvarchar(50) OUTPUT,
	@ReleaseDate nvarchar(30) OUTPUT 
AS
SELECT @GameName = GameName, @Genre = Genre, @ReleaseDate = ReleaseDate
FROM Main 
WHERE GameID = @GameID;
GO
-- Run the procedure
DECLARE @GameName nvarchar(30);
DECLARE @Genre nvarchar(50);
DECLARE @ReleaseDate nvarchar(30);
EXEC spMainInfo 3, @GameName OUTPUT, @Genre OUTPUT, @ReleaseDate OUTPUT;
SELECT @GameName AS 'Title', @Genre AS 'Genre', @ReleaseDate AS 'Release Date';

-- Stored procedure that has a return value 
USE myVideoGameCollection;
GO
CREATE PROC spGameCount
AS
DECLARE @GameCount int;
SELECT @GameCount = COUNT(*)
FROM Main 
RETURN @GameCount;
GO

DECLARE @GameCount int;
EXEC @GameCount = spGameCount;
PRINT 'There are ' + CONVERT(varchar, @GameCount) + ' games in your database';
GO*/

/* Final Project User Defined Functions 

-- creates the function
USE myVideoGameCollection;
GO
CREATE FUNCTION fnGetNines
    (@NineOutOfTen nvarchar(50) = '9')
    RETURNS int
BEGIN
    RETURN (SELECT Rating FROM Reviews WHERE Rating Like @NineOutOfTen);
END; 

-- uses the function
GO
SELECT ReviewID, Rating, ReviewDate FROM Reviews 
WHERE Rating = dbo.fnGetNines('9');

USE myVideoGameCollection;
GO
CREATE FUNCTION fnProducts
	(@GoodRating nvarchar(50) = '9')
	RETURNS table
RETURN
	(SELECT * FROM Reviews WHERE Rating LIKE @GoodRating);
GO
SELECT * FROM dbo.fnProducts('%9%');*/

 /* Final Project Triggers 

 -- create archive table by copying Game table without any rows
 USE myVideoGameCollection;
 GO
 SELECT * INTO GameArchive
 FROM Main
 WHERE 1=0;

  -- update gamearchive table and add activity column for status
 ALTER TABLE GameArchive
 ADD Activity varchar(50);
 GO

  -- create insert trigger
 CREATE TRIGGER GameArchive_INSERT ON Main
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @GameID int
	DECLARE @GameName nvarchar(30)
	DECLARE @Genre nvarchar(20)
	DECLARE @ReleaseDate nvarchar(50)


    SELECT @GameID =INSERTED.GameID, @GameName = INSERTED.GameName, @Genre = INSERTED.Genre,
	@ReleaseDate = INSERTED.ReleaseDate FROM INSERTED

    INSERT INTO GameArchive VALUES(@GameID,@GameName, @Genre,@ReleaseDate, 'Inserted' )
END
GO

-- add row into Main to test insert trigger
INSERT INTO Main VALUES(6,'Skyrim','RPG','11/11/2011');
GO
-- view data in customer archive
SELECT * FROM GameArchive;
GO

 -- create delete trigger
 CREATE TRIGGER GameArchive_Delete ON Main
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @GameID int
	DECLARE @GameName nvarchar(30)
	DECLARE @Genre nvarchar(20)
	DECLARE @ReleaseDate nvarchar(50)

    SELECT @GameID = DELETED.GameID, @GameName = DELETED.GameName, @Genre = DELETED.Genre,
	@ReleaseDate = DELETED.ReleaseDate FROM DELETED

    INSERT INTO GameArchive VALUES(@GameID,@GameName, @Genre,@ReleaseDate, 'DELETED' )
END
GO
-- delete row from customer to test delete trigger
DELETE FROM Main WHERE GameID = 6;
GO

-- view data in customer archive
SELECT * FROM GameArchive;


 -- create update trigger
 CREATE TRIGGER GameArchive_Update ON Main
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @GameID int
	DECLARE @GameName nvarchar(30)
	DECLARE @Genre nvarchar(20)
	DECLARE @ReleaseDate nvarchar(50)

    SELECT @GameID =INSERTED.GameID, @GameName = INSERTED.GameName, @Genre = INSERTED.Genre,
	@ReleaseDate = INSERTED.ReleaseDate	FROM INSERTED

	-- Since all the data is being written to the archive table, there is no need to identify what was changed
    INSERT INTO GameArchive VALUES(@GameID,@GameName, @Genre, @ReleaseDate, 'Updated' )
END
GO
-- insert a new row and then update the row (this will test the insert and update triggers)
INSERT INTO Main VALUES(7,'Pokemon Blue','RPG','09/28/1998');
GO
UPDATE Main 
SET Genre = 'Roleplaying Game'
WHERE GameID = 7;
GO
-- view data in customer archive
SELECT * FROM GameArchive;*/