USE [test]
GO
alter TRIGGER NewBlog
on dbo.BLOG_POST
AFTER INSERT 
AS 
 DECLARE @blogid INT
 SELECT @blogid =BP_id from INSERTED
	 insert into dbo.BlogUpdate values (@blogid,getdate(),'inserted')
	 print @blogid


