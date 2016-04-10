// This query retrievs all Parties and candidates that was elected in Galway area.

MATCH
	col=(c:Constituency)-[cnd:CANDIDATE]->(p:Person)<-[m:MEMBER]-(prt:Party)
WHERE
	c.area CONTAINS 'Galway' AND cnd.excluded = 0
RETURN
	DISTINCT col, prt.name