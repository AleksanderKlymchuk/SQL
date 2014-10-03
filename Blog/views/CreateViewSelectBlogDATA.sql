CREATE VIEW SelectBlogData
AS
SELECT     b_p.id, b_p.title, Par.Name AS ParentCategory, Par1.Name AS ChildCategory, b_p.[content], U.FirstName AS Author, dbo.Comments.Comment, C.FirstName AS Commentator, 
                      dbo.Comments.TimeOfComments
FROM         dbo.blog AS b_p LEFT OUTER JOIN
                      dbo.Users AS U ON U.id = b_p.userid LEFT OUTER JOIN
                      dbo.blogtocategories ON b_p.id = dbo.blogtocategories.blogid LEFT OUTER JOIN
                      dbo.Categories AS Par ON dbo.blogtocategories.categoriesid = Par.id LEFT OUTER JOIN
                      dbo.Categories AS Par1 ON Par.id = Par1.parentid LEFT OUTER JOIN
                      dbo.Comments ON b_p.id = dbo.Comments.B_id LEFT OUTER JOIN
                      dbo.Users AS C ON dbo.Comments.U_id = C.id