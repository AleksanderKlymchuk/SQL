SELECT * FROM dbo.Categories 
inner join dbo.blogtocategories on dbo.Categories.id=dbo.blogtocategories.categoriesid
inner join dbo.blog on dbo.blogtocategories.blogid=dbo.blog.id