-- Part 2: SQL script file that creates the tables and populates them

-- create the tables
CREATE TABLE Property(
	address VARCHAR(50) NOT NULL,
	ownerName VARCHAR(30),
	price INTEGER,
	PRIMARY KEY(address)
);

CREATE TABLE House(
	address VARCHAR(50) NOT NULL,
	ownerName VARCHAR(30),
	price INTEGER,
	bedrooms INTEGER,
	bathrooms INTEGER,
	size INTEGER,
	FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE BusinessProperty(
	address VARCHAR(50) NOT NULL,
	ownerName VARCHAR(30),
	price INTEGER,
	type CHAR(20),
	size INTEGER,
	FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE Firm(
	id INTEGER NOT NULL,
	name VARCHAR(30),
	address VARCHAR(50),
	PRIMARY KEY(id)
);

CREATE TABLE Agent(
	agentId INTEGER NOT NULL,
	name VARCHAR(30),
	phone CHAR(12),
	firmId INTEGER NOT NULL,
	dateStarted DATE,
	PRIMARY KEY(agentId),
	FOREIGN KEY(firmId) REFERENCES Firm(id)
);

CREATE TABLE Listings(
	address VARCHAR(50),
	agentId INTEGER,
	mlsNumber INTEGER,
	dateListed DATE,
	PRIMARY KEY(mlsNumber),
	FOREIGN KEY(agentId) REFERENCES Agent(agentId),
	FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE Buyer(
	id INTEGER NOT NULL,
	name VARCHAR(30),
	phone CHAR(12),
	propertyType CHAR(20),
	bedrooms INTEGER,
	bathrooms INTEGER,
	businessPropertyType CHAR(20),
	minimumPreferredPrice INTEGER,
	maximumPreferredPrice INTEGER,
	PRIMARY KEY(id)
);

CREATE TABLE Works_With(
	buyerId INTEGER NOT NULL,
	agentId INTEGER NOT NULL,
	FOREIGN KEY(buyerId) REFERENCES Buyer(id),
	FOREIGN KEY(agentId) REFERENCES Agent(agentId)
);



-- now insert data
-- first 5 are House and last 5 are BusinessProperty
INSERT INTO Property (address, ownerName, price)
VALUES
('1111 Fake Street', 'Fake Name', 100000),
('555 Main Street', 'John Smith', 250000),
('9545 Rich Road', 'First Last', 4000000),
('1234 Fake Street', 'Patrick Stringer', 82000),
('424 Windy Pine Lane', 'Jack Clay', 154000),
('1050 Walden Street', 'Fake Owner', 75000),
('960 Twisty Road', 'Paul Daniels', 150000),
('9998 Expensive Avenue', 'Clifford Blakeley', 2000000),
('1221 Some Street', 'Shanna Jones', 550000),
('4004 Jackson Road', 'Rachel Griffin', 25000)
;

INSERT INTO House (address, ownerName, price, bedrooms, bathrooms, size)
VALUES
('1111 Fake Street', 'Fake Name', 100000, 3, 2, 1000),
('555 Main Street', 'John Smith', 250000, 4, 2, 1500),
('9545 Rich Road', 'First Last', 4000000, 5, 4, 50000),
('1234 Fake Street', 'Patrick Stringer', 82000, 2, 2, 950),
('424 Windy Pine Lane', 'Jack Clay', 154000, 3, 2, 1250)
;

INSERT INTO BusinessProperty (address, ownerName, price, type, size)
VALUES
('1050 Walden Street', 'Fake Owner', 75000, 'gas station', 500),
('960 Twisty Road', 'Paul Daniels', 150000, 'store front', 1450),
('9998 Expensive Avenue', 'Clifford Blakeley', 2000000, 'office space', 3500),
('1221 Some Street', 'Shanna Jones', 550000, 'office space', 1200),
('4004 Jackson Road', 'Rachel Griffin', 25000, 'gas station', 150)
;

INSERT INTO Firm (id, name, address)
VALUES
(155214, 'Fake Firm', '1000 Fake Way'),
(552144, 'Craig Emerson Real Estate', '1550 Main Street'),
(999999, 'Some Firm', '777 Tennessee Street'),
(111111, 'Yet Another Firm', '9541 Alabama Road'),
(594747, 'Final Firm', '101 Rubber Ducky Road')
;

INSERT INTO Agent (agentId, name, phone, firmId, dateStarted)
VALUES
(111, 'Mary Homer', '8508508500', 155214, '1990-01-01'),
(999, 'Donnell Wiley', '8505555555', 552144, '2002-05-07'),
(555, 'Lawrence Joseph', '9045459888', 999999, '2010-09-25'),
(959, 'Mickey Martinez', '9542221111', 111111, '1995-12-20'),
(512, 'Susan Watkins', '4075254444', 594747, '2018-03-10')
;

INSERT INTO Listings (address, agentId, mlsNumber, dateListed)
VALUES
('1111 Fake Street', 111, 957412, '2018-02-25'),
('555 Main Street', 999, 957444, '2018-01-02'),
('9545 Rich Road', 555, 400045, '2017-11-25'),
('1234 Fake Street', 959, 100555, '2018-03-13'),
('424 Windy Pine Lane', 512, 444555, '2018-01-01'),
('1050 Walden Street', 512, 999888, '2018-02-02'),
('960 Twisty Road', 959, 111000, '2018-01-15'),
('9998 Expensive Avenue', 555, 000111, '2016-08-16'),
('1221 Some Street', 999, 555111, '2017-05-28'),
('4004 Jackson Road', 111, 987654, '2012-03-28')
;

INSERT INTO Buyer (id, name, phone, propertyType, bedrooms, bathrooms, businessPropertyType, minimumPreferredPrice, maximumPreferredPrice)
VALUES
(666, 'Mabel Gavin', '1234567891', 'house', 3, 2, 'NULL', 75000, 200000),
(555, 'Kristie Hardy', '8509999999', 'NULL', 0, 0, 'gas station', 20000, 200000),
(979, 'Ralph Weber', '9045555555', 'NULL', 0, 0, 'office space', 500000, 5000000),
(878, 'Bridget Garcia', '9542228888', 'NULL', 0, 0, 'store front', 100000, 200000),
(551, 'Paula Jones', '4075559999', 'house', 4, 2, 'NULL', 50000, 300000),
(566, 'Fakest Name', '4075557777', 'house', 5, 3, 'NULL', 100000, 500000)
;

INSERT INTO Works_With (buyerId, agentId)
VALUES
(666, 111),
(555, 999),
(979, 555),
(878, 959),
(551, 512),
(566, 512)
;