USE  myVideoGameCollection
GO
Create table Developer(
	DeveloperID varchar(30) not null,
	Publisher varchar(30) not null,
	Director varchar(30),
	Writer varchar(30),
	Producer varchar(30),
	Designer varchar(30),
	Composer varchar(30),
	GameID int not null,
	Primary Key(DeveloperID)
);
Go
Create table Medium(
	MediumID int not null,
	MediumName varchar(20) not null,
	IterationDate date,
	GameID int not null,
	Primary Key(MediumID)
);
Go
Create table Platform(
	PlatformID varchar(20) not null,
	Manufacturer varchar(20),
	ReleaseDate date,
	Media varchar(20),
	Generation varchar(10),
	GameID int not null,
	Primary Key(PlatformID)
);
Go
Create table Main(
	GameID int not null,
	GameName varchar(30) not null,
	Genre varchar(20),
	ReleaseDate date,
	Primary Key(GameID)
);
Go
Create table Reviews(
	ReviewID int not null,
	GameID int not null,
	ReviewerName varchar(30) not null,
	Rating decimal(3,1) not null,
	ReviewDate date,
	Primary Key(ReviewID)
);
Go
Create table Personal(
	GameID int not null,
	PlatformID varchar(20) not null,
	DateOfPurchase date,
	PersonalRating decimal(3,1) not null,
	PlayThroughs int not null,
	PRIMARY KEY (GameID,PlatformID)
);
Go