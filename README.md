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
Summarise your three queries here.
Then explain them one by one in the following sections.

#### Query one title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

#### Query two title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

#### Query three title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

## References
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database.
