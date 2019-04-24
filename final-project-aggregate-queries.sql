/* final project aggregate queries 

Task #1

USE myVideoGameCollection;
Select Reviews.ReviewerName, Count(Distinct Main.GameName) AS [Review By Name]
From Reviews Join Main On Main.GameID = Reviews.GameID
Group by Reviews.ReviewerName
Order by Reviews.ReviewerName ASC;


Task #2

Use myVideoGameCollection;
Select MIN(Reviews.Rating) AS [Minimum Review Score],
		Max(Reviews.Rating) AS [Maximum Review Score],
		AVG(Reviews.Rating) AS [Average Review Score]
From Reviews;

Task #3

USE myVideoGameCollection;
Select Count(Personal.GameID) AS [Total Games Reviewed By Me],
	   AVG(Personal.PersonalRating) AS [Average Rating]
From Personal;

Task #4*/


