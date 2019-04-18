-- Part 3: SQL script file containing SQL instructions that implement the queries

--1)Find the addresses of all houses currently listed.
SELECT Listings.address
FROM Listings, House
WHERE Listings.address = House.address;


--2)Find the addresses and MLS numbers of all houses currently listed.
SELECT Listings.address, Listings.mlsNumber
FROM Listings, House
WHERE Listings.address = House.address;


--3)Find the addresses of all 3-beedroom, 2-bathroom houses currently listed.
SELECT Listings.address
FROM Listings, House
WHERE Listings.address = House.address AND House.bathrooms = 2 AND House.bedrooms = 3;


--4)Find the addresses and prices of all 3-bedroom, 2-bathroom houses with prices in the range $100,000 to $250,000, with the results shown in descending order of price.
SELECT address, price
FROM House
WHERE bedrooms = 3 AND bathrooms = 2 AND price >= 100000 AND price <= 250000
ORDER BY price DESC;

--5)Find the addresses and prices of all business properties that are advertised as office space in descending order of price.
SELECT address, price
FROM BusinessProperty
WHERE type = 'office space'
ORDER BY price DESC;


--6)Find all the ids, names and phones of all agents, together with the names of their firms and the dates when they started.
SELECT agentId, Agent.name as "Agent Name", phone, Firm.name as "Firm Name", dateStarted
FROM Agent, Firm
WHERE Agent.firmId = Firm.id;


--7)Find all the properties currently listed by agent with id “001” (or some other suitable id).
SELECT Property.*
FROM Property, Listings
WHERE Property.address = Listings.address AND Listings.agentId = 555;


--8)Find all Agent.name-Buyer.name pairs where the buyer works with the agent, sorted alphabetically by Agent.name. 
SELECT Agent.name, Buyer.name
FROM Works_With, Agent, Buyer
WHERE Works_With.agentId = Agent.agentId
AND Works_With.buyerId = Buyer.id
ORDER BY Agent.name; 

--9)For each agent, find the total number of buyers currently working with that agent, i.e., the output should be Agent.id-count pairs. 

SELECT DISTINCT Agent.agentId, (SELECT COUNT(Works_With.buyerId) FROM Works_With WHERE Agent.agentId = Works_With.agentId) AS "Num of buyers working with given agent"
FROM Agent, Buyer, Works_With
WHERE Works_With.agentId = Agent.agentId
AND Works_With.buyerId = Buyer.id;

/*
10)For some buyer that is interested in a house, where the buyer is identified by an id (e.g., “001”), find all houses that meet the buyer’s preferences, 
	with the results shown in descending order of price.
*/	
SELECT House.*
FROM House, Buyer
WHERE Buyer.id = 666 AND
    Buyer.bedrooms = House.bedrooms AND
    Buyer.bathrooms = House.bathrooms AND
    Buyer.minimumPreferredPrice <= House.price AND
    Buyer.maximumPreferredPrice >= House.price;
	
