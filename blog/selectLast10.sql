SELECT TOP 10 * FROM blog 
inner join dbo.Status on dbo.Status.id=dbo.blog.statusid
where dbo.Status.status='published'