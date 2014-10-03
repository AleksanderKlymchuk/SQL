CREATE PROCEDURE TagPick @tag nvarchar(255)
AS
SELECT t.Tag, b.Title FROM  dbo.Tags as t
INNER JOIN dbo.Blog_To_Tag as bt on bt.Tag_id=t.T_id
INNER JOIN dbo.BLOG_POST AS b on  b.BP_id=bt.Blog_id
WHERE b.title=@tag
