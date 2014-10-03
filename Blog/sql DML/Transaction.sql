USE test;
GO
BEGIN TRANSACTION;
GO
		INSERT INTO dbo.STATUSES VALUES('pending'),('published'),('Archived'),('Hidden');
GO		 
		INSERT INTO dbo.PRIVILEGES Values('read'),('write'),('delete'),('update');
GO
		INSERT INTO dbo.ROLES VALUES ('Admin'),('Athor'),('Commentator');
GO
		INSERT INTO dbo.Privileges_To_Role VALUES ('8','1'),('1','2'),('1','3'),('1','4'),('2','1'),('2','2'),('2','4'),('3','1'),('3','2');
GO
COMMIT TRANSACTION;