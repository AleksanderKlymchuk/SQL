SELECT cat1.Name as Firstlevel,  cat2.Name as Secondlevel, COUNT(blogpost.id) as Amount
from dbo.Categories as cat1
left join Categories as cat2 on cat1.id=cat2.parentid
left outer join blogtocategories on blogtocategories.categoriesid=cat1.id
left outer join blog as blogpost on blogpost.id=blogtocategories.blogid
where cat1.parentid is null
group by cat1.Name, cat2.Name