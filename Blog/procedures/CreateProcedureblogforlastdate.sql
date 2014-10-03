CREATE PROCEDURE BlogForLastDate
@day int, @status nvarchar(255)
AS
declare @date datetime
select @date=GETDATE()-@day
select DISTINCT b.Title,b.Date_of_creation,t.Tag, r.[Role], s.[Status] from dbo.BLOG_POST AS b
left join dbo.Blog_To_Tag on b.BP_id=dbo.Blog_To_Tag.blog_id
left join dbo.TAGS AS t on dbo.Blog_To_Tag.Tag_id=t.T_id 
left join dbo.BLOGGERS on b.B_id=dbo.BLOGGERS.B_id 
left join dbo.Role_To_Bloger on dbo.Role_To_Bloger.R_id=dbo.BLOGGERS.B_id
left join dbo.ROLES as r on dbo.Role_To_Bloger.R_id=r.R_id
left join dbo.STATUSES as s on s.S_id=B.S_id
where b.Date_of_creation >=@date and s.[status]=@status;
execute dbo.BlogForLastDate 1,'pending'