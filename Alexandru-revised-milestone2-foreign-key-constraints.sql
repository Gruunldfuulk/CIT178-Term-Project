USE myVideoGameCollection;
GO
ALTER TABLE Reviews WITH CHECK
ADD CONSTRAINT FK_GameID_Reviews FOREIGN KEY(GameID) REFERENCES Main(GameID)
ON UPDATE CASCADE;
GO
ALTER TABLE Platform WITH CHECK
ADD CONSTRAINT FK_GameID_Platform FOREIGN KEY(GameID) REFERENCES Main(GameID)
ON UPDATE CASCADE;
GO
ALTER TABLE Developer WITH CHECK
ADD CONSTRAINT FK_GameID_Developer FOREIGN KEY(GameID) REFERENCES Main(GameID)
ON UPDATE CASCADE;
GO
ALTER TABLE Medium WITH CHECK
ADD CONSTRAINT FK_GameID_Medium FOREIGN KEY(GameID) REFERENCES Main(GameID)
ON UPDATE CASCADE;
GO
ALTER TABLE Personal WITH CHECK
ADD CONSTRAINT FK_GameID_Personal FOREIGN KEY(GameID) REFERENCES Main(GameID)
ON UPDATE CASCADE;
GO 
ALTER TABLE Personal WITH CHECK
ADD CONSTRAINT FK_PlatformID_Personal FOREIGN KEY(PlatformID) REFERENCES Platform(PlatformID);
GO