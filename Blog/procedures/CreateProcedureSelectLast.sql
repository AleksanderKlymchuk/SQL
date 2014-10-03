
CREATE PROCEDURE PickLast
@amount int, @status nvarchar(255)
AS
SELECT TOP (@amount)b.Title,COUNT(b.BP_id) as [number of blogs]  FROM BLOG_POST AS b
inner join dbo.STATUSES on dbo.STATUSES.S_id=b.S_id
where dbo.STATUSES.[Status]=@status
GROUP BY b.Title