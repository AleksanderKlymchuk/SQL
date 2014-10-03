CREATE PROCEDURE CreateBlogPost
               --parameters
@Title nvarchar(255),@Content nvarchar(255),@TagId1 int,@TagId2 int,@Category int,@Status int 
AS
               --local variable
DECLARE @Sname int, @blogid int
                
BEGIN TRY                
SELECT @Sname=(SELECT dbo.[Status].id FROM dbo.Status where dbo.[Status].name='pending')
END TRY
BEGIN CATCH  
SELECT @Sname=@Status
END CATCH
INSERT INTO dbo.blog 
values(@Title,@Content,null,@Sname,1,null,null);
                 
SELECT  @Blogid=(SELECT TOP(1) dbo.blog.id AS ID FROM DBO.blog ORDER BY ID DESC);
INSERT INTO dbo.blogtocategories values (@blogid,@Category)
INSERT INTO dbo.blogtotag values(@blogid,@TagId1),(@blogid,@TagId2);
