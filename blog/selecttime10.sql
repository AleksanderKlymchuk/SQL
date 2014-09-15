select  dbo.blog.title,dbo.blog.dateofcreation,dbo.blog.dateofupdate, dbo.tag.Tags, dbo.[Role].RoleName, dbo.[Status].name from dbo.blog
inner join dbo.blogtotag on dbo.blog.id=dbo.blogtotag.blogid
inner join dbo.Tag on dbo.blogtotag.tagid=dbo.tag.id 
inner join dbo.Users on dbo.blog.userid=dbo.Users.id 
inner join dbo.roletouser on dbo.roletouser.userid=dbo.Users.id
inner join dbo.[Role] on dbo.roletouser.roleid=dbo.[Role].id
inner join dbo.Status on dbo.[Status].id=dbo.blog.statusid
where dbo.blog.dateofupdate >=GETDATE()-10 and dbo.[Status].name='pending';