SELECT blo.title as BlogPost,cat.Name as Category,cat1.Name as Child
from dbo.blog as blo 
left outer join dbo.blogtocategories on blo.id=dbo.blogtocategories.blogid 
left outer join dbo.Categories as cat on dbo.blogtocategories.categoriesid=cat.id
left join Categories AS cat1 on cat.id=cat1.parentid
where cat1.parentid is null