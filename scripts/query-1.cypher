// Describe your query
// at the start
// in comments.


MATCH 
	(c:Constituency)-[r:CANDIDATE]->(p)
WHERE r.elected > 0
	return r