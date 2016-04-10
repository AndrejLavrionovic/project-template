// This query shows all females candidates had being elected
// and in what count.


match
p=(c:Constituency)-[r:CANDIDATE]->(n)
where n.gender = "Female" AND r.elected > 0
return r, max(r.elected)