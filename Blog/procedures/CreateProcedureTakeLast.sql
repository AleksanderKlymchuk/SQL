CREATE PROCEDURE PickLast
@amount int, @status nvarchar(255)
AS
SELECT TOP (@amount) * FROM blog 
inner join dbo.Status on dbo.Status.id=dbo.blog.statusid
where dbo.Status.name=@status
execute dbo.PickLast 2,'pending'
