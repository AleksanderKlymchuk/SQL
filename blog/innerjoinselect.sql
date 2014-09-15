SELECT dbo.Tag.Tags,dbo.blog.title FROM dbo.Tag
INNER JOIN dbo.blogtotag on dbo.blogtotag.tagid=dbo.Tag.id 
INNER JOIN dbo.blog on dbo.blog.id=dbo.blogtotag.blogid
WHERE dbo.blog.title='Gas prices fall'