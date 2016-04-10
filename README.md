# Irish Constituencies Neo4j Database
###### Andrej Lavrinovic, G00196984

## Introduction
Neo4j database that contain data about Ireland election 2016 including candidates, constituencys, parties. All infomation was taken from www.rte.ie/news/election-2016 .

The goal of this project is to learn neo4j, how to store and retreave data using cypher lenguage.

## Database
To create database I used computer environment such as Mycrosoft Office Spredsheet, Notepad++, Firefox browser and Noe4j server.

Using spredsheet I created templates for insertion, populated particular columns with data that was taken from source ( see election2016.xlsx file ). Then I copied all into notepad++ and removed tab spaces (see scripts/CreateWholeDb.txt) and after copied all script into neo4j browser. After execution Database was successfuly created.

Database was populated with

- Candidates - labeled :Person nodes with name and gender properties
- Constituencies - labeled :Constituency nodes with area, seats, electorate, validvotes, spoiled and quota properties
- Parties - labeled :Party nodes with name property
- Party-Candidate relations - :MEMBER
- Constituency-Candidate relation - :CANDIDATE with elected, excluded and votes properties. If elected or excluded is not 0, the number shows in what count the candidate was elected or excluded. 0 means that candidate wasn't elected or excluded. The candidate cannot to be elected and excluded at the same time, that means it is allways 0 for one or another property.

## Queries
Queries are used to retrieved some information about candidates from neo4j database. All queries contain match, where and return sections.

#### Query one title
This query retrieves all female candidates that had being elected and in what count
```cypher
match
	p=(c:Constituency)-[r:CANDIDATE]->(n)
where
	n.gender = "Female" AND r.elected > 0
return
	r, max(r.elected);
```

#### Query two title
This query retreives all parties and candidates that was elected in Galway area
```cypher
MATCH
	col=(c:Constituency)-[cnd:CANDIDATE]->(p:Person)<-[m:MEMBER]-(prt:Party)
WHERE
	c.area CONTAINS 'Galway' AND cnd.excluded = 0
RETURN
	DISTINCT col, prt.name, max()
```

#### Query three title
This query retrievs all parties and members that wasn't elected
```cypher
MATCH
	col=(c:Constituency)-[cnd:CANDIDATE]->(p:Person)<-[m:MEMBER]-(prt:Party)
WHERE
	ALL(x IN nodes(col) WHERE cnd.elected = 0)
RETURN
	DISTINCT m, prt.name;
```

## References
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database.
2. [rte website](http://www.rte.ie/news/election-2016/), all informaton about election 2016
