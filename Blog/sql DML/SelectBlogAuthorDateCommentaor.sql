create view GetDataOfBlog 
as 
SELECT    b_p.id, b_p.title, Par.Name AS ParentCategory, Par1.Name as ChildCategory,b_p.content,U.FirstName as Author,
                      dbo.Comments.Comment, C.FirstName as Commentator,dbo.Comments.TimeOfComments
FROM         dbo.blog as b_p left outer JOIN
              
                      dbo.Users as U on u.id=b_p.userid left outer join
                      dbo.blogtocategories on b_p.id=blogtocategories.blogid left outer join 
                      dbo.Categories AS Par ON blogtocategories.categoriesid = par.id LEFT JOIN
                      dbo.Categories as Par1 on par.id=par1.parentid left outer join
                      dbo.Comments ON b_p.id = dbo.Comments.B_id left outer join
                      dbo.Users AS C ON dbo.Comments.U_id=C.id 
                     