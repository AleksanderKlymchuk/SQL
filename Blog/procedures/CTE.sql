USE blog
Go 
WITH cteTable(Cid,Category,Parentid)
as
(
  SELECT c.C_id, c.Category, Chaild_id
  FROM Categories AS c
  where c.Chaild_id is null
  
  UNION ALL 
  
  SELECT c.C_id, c.Category, Chaild_id
  FROM Categories as c
  join cteTable 
  on  c.Chaild_id=cteTable.Cid

)
SELECT MaCat.Category as [Main Category],
COUNT(distinct b.BP_id) as [Number of blogs in main category],COUNT(b.BP_id) as [Number of blogs in child category]
from cteTable as MaCat 
left join BLOG_TO_CATEGORY as bc
on bc.Cat_gid=MaCat.Cid
left join BLOG_POST as b 
on b.BP_id=bc.B_Id 

left join cteTable as ChCat 
on MaCat.Cid=ChCat.Parentid

WHERE MaCat.Parentid IS NULL 
group by  MaCat.Category
