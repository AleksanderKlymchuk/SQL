select b.title, count(c.C_id) as number_of_comments,u.FirstName
from Comments as c
Right outer join blog as b on c.B_id=b.id
left outer join Users as u on c.U_id=u.id
group by title,FirstName