select *,s.[status] from dbo.BLOG_POST 
inner join dbo.STATUSES as s
on S.S_id=dbo.BLOG_POST.S_id 
for xml auto, elements