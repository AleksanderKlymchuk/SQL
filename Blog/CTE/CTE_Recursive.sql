USE blog
Go 
WITH cteTable(Cid,Category,Parentid)
as
(
  SELECT c.id, c.Name, parentid
  FROM Categories AS c
  where c.parentid is null
  
  UNION ALL 
  
  SELECT c.id ,c.Name, c.parentid
  FROM categories as c
  join cteTable 
  on  c.parentid=cteTable.Cid

)
SELECT MaCat.Category as [Main Category],
COUNT(distinct b.id) as [Number of blogs in main category],COUNT(b.id) as [Number of blogs in child category]
from cteTable as MaCat 
left join blogtocategories as bc
on bc.categoriesid=MaCat.Cid
left join blog as b 
on b.id=bc.blogid 

left join cteTable as ChCat 
on MaCat.Cid=ChCat.Parentid

WHERE MaCat.Parentid IS NULL 
group by  MaCat.Category







  
 
   
 