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
MERGE (:Genre {name: 'Horror'});
MERGE (:Genre {name: 'Fantasy'});

// === Movies ===
MERGE (:Movie {id: 1, title: 'No Limite do Amanhã', year: 2014});
MERGE (:Movie {id: 2, title: 'A Origem', year: 2010});
MERGE (:Movie {id: 3, title: 'Matrix', year: 1999});
MERGE (:Movie {id: 4, title: 'Interestelar', year: 2014});
MERGE (:Movie {id: 5, title: 'O Poderoso Chefão', year: 1972});
MERGE (:Movie {id: 6, title: 'Edward Mãos de Tesoura', year: 1990});
MERGE (:Movie {id: 7, title: 'Drácula de Bram Stoker', year: 1992});
MERGE (:Movie {id: 8, title: 'Advogado do Diabo', year: 1997});
MERGE (:Movie {id: 9, title: 'A Lenda do Cavaleiro sem Cabeça', year: 1999});
MERGE (:Movie {id: 10, title: 'De Olhos Bem Fechados', year: 1999});

// === Series ===
MERGE (:Series {id: 1, title: 'Breaking Bad', seasons: 5});
MERGE (:Series {id: 2, title: 'Stranger Things', seasons: 4});
MERGE (:Series {id: 3, title: 'True Detective', seasons: 4});
MERGE (:Series {id: 4, title: 'Game of Thrones', seasons: 8});
MERGE (:Series {id: 5, title: 'Black Mirror', seasons: 6});

// === Users ===
MERGE (:User {id: 1, name: 'Alice'});
MERGE (:User {id: 2, name: 'Bruno'});
MERGE (:User {id: 3, name: 'Carla'});
MERGE (:User {id: 4, name: 'Diego'});
MERGE (:User {id: 5, name: 'Eliza'});
MERGE (:User {id: 6, name: 'Antônio'});
MERGE (:User {id: 7, name: 'Bárbara'});
MERGE (:User {id: 8, name: 'Carlos'});
MERGE (:User {id: 9, name: 'Dayana'});
MERGE (:User {id: 10, name: 'Elias'});

// === Actors ===
MERGE (:Actor {id: 1, name: 'Tom Cruise'});
MERGE (:Actor {id: 2, name: 'Keanu Reeves'});
MERGE (:Actor {id: 3, name: 'Bryan Cranston'});
MERGE (:Actor {id: 4, name: 'Millie Bobby Brown'});
MERGE (:Actor {id: 5, name: 'Leonardo DiCaprio'});
MERGE (:Actor {id: 6, name: 'Matthew McConaughey'});
MERGE (:Actor {id: 7, name: 'Al Pacino'});
MERGE (:Actor {id: 8, name: 'Johnny Depp'});
MERGE (:Actor {id: 9, name: 'Winona Ryder'});
MERGE (:Actor {id: 10, name: 'Nicole Kidman'});
MERGE (:Actor {id: 11, name: 'Kit Harington'});
MERGE (:Actor {id: 12, name: 'Toby Kebbell'});

// === Directors ===
MERGE (:Director {id: 1, name: 'Christopher Nolan'});
MERGE (:Director {id: 2, name: 'Francis Ford Coppola'});
MERGE (:Director {id: 3, name: 'Vince Gilligan'});
MERGE (:Director {id: 4, name: 'Doug Liman'});
MERGE (:Director {id: 5, name: 'Sisters Wachowski'});
MERGE (:Director {id: 6, name: 'Tim Burton'});
MERGE (:Director {id: 7, name: 'Taylor Hackford'});
MERGE (:Director {id: 8, name: 'Stanley Kubrick'});

// === Genre Relationships ===
MATCH (m:Movie {id: 1}), (g:Genre {name: 'Action'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 2}), (g:Genre {name: 'Sci-Fi'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 3}), (g:Genre {name: 'Sci-Fi'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 4}), (g:Genre {name: 'Sci-Fi'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 5}), (g:Genre {name: 'Drama'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 6}), (g:Genre {name: 'Fantasy'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 7}), (g:Genre {name: 'Horror'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 8}), (g:Genre {name: 'Horror'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 9}), (g:Genre {name: 'Horror'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id: 10}), (g:Genre {name: 'Drama'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (s:Series {id: 1}), (g:Genre {name: 'Drama'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id: 2}), (g:Genre {name: 'Sci-Fi'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id: 3}), (g:Genre {name: 'Drama'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id: 4}), (g:Genre {name: 'Fantasy'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id: 5}), (g:Genre {name: 'Sci-Fi'}) MERGE (s)-[:IN_GENRE]->(g);

// === Acting Relationships ===
MATCH (a:Actor {id: 1}), (m:Movie {id: 1}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 2}), (m:Movie {id: 3}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 3}), (s:Series {id: 1}) MERGE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id: 4}), (s:Series {id: 2}) MERGE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id: 5}), (m:Movie {id: 2}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 6}), (m:Movie {id: 4}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 7}), (m:Movie {id: 5}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 8}), (m:Movie {id: 6}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 9}), (m:Movie {id: 6}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 2}), (m:Movie {id: 7}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 9}), (m:Movie {id: 7}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 2}), (m:Movie {id: 8}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 7}), (m:Movie {id: 8}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 8}), (m:Movie {id: 9}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 1}), (m:Movie {id: 10}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 10}), (m:Movie {id: 10}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id: 6}), (s:Series {id: 3}) MERGE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id: 9}), (s:Series {id: 2}) MERGE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id: 11}), (s:Series {id: 4}) MERGE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id: 12}), (s:Series {id: 5}) MERGE (a)-[:ACTED_IN]->(s);

// === Directing Relationships ===
MATCH (d:Director {id: 1}), (m:Movie {id: 2}) MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id: 2}), (m:Movie {id: 5}) MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id: 3}), (s:Series {id: 1}) MERGE (d)-[:DIRECTED]->(s);
MATCH (d:Director {id: 4}), (m:Movie {id: 1}) MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id: 5}), (m:Movie {id: 3}) MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id: 1}), (m:Movie {id: 4}) MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id: 6}), (m:Movie {id: 6}) MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id: 2}), (m:Movie {id: 7}) MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id: 7}), (m:Movie {id: 8}) MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id: 6}), (m:Movie {id: 9}) MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id: 8}), (m:Movie {id: 10}) MERGE (d)-[:DIRECTED]->(m);

// === User WATCHED Relationships ===
MATCH (u:User), (m:Movie)
WITH u, collect(m) AS movies
WITH u, movies, apoc.coll.randomItems(movies, toInteger(rand()*3)+2, true) AS picked
UNWIND picked AS movie
CREATE (u)-[:WATCHED {rating: toInteger(rand()*5)+1}]->(movie);

MATCH (u:User), (s:Series)
WITH u, collect(s) AS series
WITH u, series, apoc.coll.randomItems(series, toInteger(rand()*3)+1, true) AS picked
UNWIND picked AS show
CREATE (u)-[:WATCHED {rating: toInteger(rand()*5)+1}]->(show);