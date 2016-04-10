// This query retrievs all parties and members that wasn't elected


MATCH
	col=(c:Constituency)-[cnd:CANDIDATE]->(p:Person)<-[m:MEMBER]-(prt:Party)
WHERE
	ALL(x IN nodes(col) WHERE cnd.elected = 0)
RETURN
	DISTINCT m, prt.name;