// === Constraints ===
CREATE CONSTRAINT user_id_unique IF NOT EXISTS
FOR (u:User) REQUIRE u.id IS UNIQUE;

CREATE CONSTRAINT movie_id_unique IF NOT EXISTS
FOR (m:Movie) REQUIRE m.id IS UNIQUE;

CREATE CONSTRAINT series_id_unique IF NOT EXISTS
FOR (s:Series) REQUIRE s.id IS UNIQUE;

CREATE CONSTRAINT actor_id_unique IF NOT EXISTS
FOR (a:Actor) REQUIRE a.id IS UNIQUE;

CREATE CONSTRAINT director_id_unique IF NOT EXISTS
FOR (d:Director) REQUIRE d.id IS UNIQUE;

// === Genres ===
MERGE (:Genre {name: 'Action'});
MERGE (:Genre {name: 'Drama'});
MERGE (:Genre {name: 'Comedy'});
MERGE (:Genre {name: 'Sci-Fi'});

// === Users ===
UNWIND range(1,10) AS id
CREATE (:User {id: id, name: 'User ' + id});

// === Movies ===
CREATE (:Movie {id: 1, title: 'Edge of Tomorrow', year: 2014});
CREATE (:Movie {id: 2, title: 'Inception', year: 2010});
CREATE (:Movie {id: 3, title: 'The Matrix', year: 1999});
CREATE (:Movie {id: 4, title: 'Interstellar', year: 2014});
CREATE (:Movie {id: 5, title: 'The Godfather', year: 1972});

// === Series ===
CREATE (:Series {id: 6, title: 'Breaking Bad', seasons: 5});
CREATE (:Series {id: 7, title: 'Stranger Things', seasons: 4});
CREATE (:Series {id: 8, title: 'The Office', seasons: 9});
CREATE (:Series {id: 9, title: 'Game of Thrones', seasons: 8});
CREATE (:Series {id: 10, title: 'Black Mirror', seasons: 6});

// === Actors ===
CREATE (:Actor {id: 1, name: 'Tom Cruise'});
CREATE (:Actor {id: 2, name: 'Keanu Reeves'});
CREATE (:Actor {id: 3, name: 'Bryan Cranston'});
CREATE (:Actor {id: 4, name: 'Millie Bobby Brown'});

// === Directors ===
CREATE (:Director {id: 1, name: 'Christopher Nolan'});
CREATE (:Director {id: 2, name: 'Francis Ford Coppola'});
CREATE (:Director {id: 3, name: 'Vince Gilligan'});

// === Genre Relationships ===
MATCH (m:Movie {id: 1}), (g:Genre {name: 'Action'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 2}), (g:Genre {name: 'Sci-Fi'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (s:Series {id: 6}), (g:Genre {name: 'Drama'}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id: 8}), (g:Genre {name: 'Comedy'}) CREATE (s)-[:IN_GENRE]->(g);

// === Acting Relationships ===
MATCH (a:Actor {id: 1}), (m:Movie {id: 1}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 2}), (m:Movie {id: 3}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 3}), (s:Series {id: 6}) CREATE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id: 4}), (s:Series {id: 7}) CREATE (a)-[:ACTED_IN]->(s);

// === Directing Relationships ===
MATCH (d:Director {id: 1}), (m:Movie {id: 2}) CREATE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id: 2}), (m:Movie {id: 5}) CREATE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id: 3}), (s:Series {id: 6}) CREATE (d)-[:DIRECTED]->(s);

// === User WATCHED Relationships ===
MATCH (u:User), (m:Movie)
WHERE m.id IN [1,2,3]
WITH u, m ORDER BY rand() LIMIT 1
CREATE (u)-[:WATCHED {rating: toInteger(rand()*5)+1}]->(m);

MATCH (u:User), (s:Series)
WHERE s.id IN [6,7,8]
WITH u, s ORDER BY rand() LIMIT 1
CREATE (u)-[:WATCHED {rating: toInteger(rand()*5)+1}]->(s);