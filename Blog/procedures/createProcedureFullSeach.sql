CREATE PROCEDURE FULLSEACH 
@TEXT nvarchar(255)
AS 
SELECT b.content, b.Title FROM dbo.Blog_Post as b
WHERE b.content like @TEXT OR b.title like @TEXT
