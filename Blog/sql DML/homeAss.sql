USE [blog]
GO
/****** Object:  StoredProcedure [dbo].[DataIn]    Script Date: 09/17/2014 12:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter procedure [dbo].[DataIn]
@fname nvarchar(50),
@lname nvarchar(50),
@Email nvarchar(50)
AS 
insert into dbo.Users(FirstName,LastName,Email)values (@fname,@lname,@Email)
GO
DECLARE @UserId int
SELECT  @UserId=(SELECT TOP(1)(dbo.Users.id) AS ID FROM DBO.Users ORDER BY ID DESC);
insert into dbo.roletouser(userid,roleid) values(@UserId,2),(@UserId,3)

/*GO
exec DataIn 'dan','gro','test'
*/
GO
select * from dbo.Users