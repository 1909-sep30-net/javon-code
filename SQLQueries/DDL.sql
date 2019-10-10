-- Data Definition Language
-- CREATE, ALTER, DROP
-- CREATE TABLE, CREATE FUNCTION, CREATE TRIGGER, CREATE VIEW

-- in SQL, every object (e.g. table) must be in a schema

-- SQL Server has a default schema named dbo
CREATE SCHEMA Poke;
GO

DROP TABLE Poke.Pokemon;
DROP TABLE Poke.Type;

CREATE TABLE Poke.Pokemon (
	PokemonId INT NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	Height DECIMAL(6,2) NULL,
	TypeID INT NOT NULL,
	CONSTRAINT CK_Height_Nonnegative CHECK (Height IS NULL OR Height >= 0)
);

ALTER TABLE Poke.Pokemon ADD CONSTRAINT
	PK_PokemonId PRIMARY KEY (PokemonId);

CREATE TABLE Poke.Type (
	TypeId INT NOT NULL,
	Name NVARCHAR(30) NOT NULL,
	CONSTRAINT PK_TypeId PRIMARY KEY (TypeId)
);

ALTER TABLE Poke.Pokemon ADD CONSTRAINT
	FK_TypeId_Type FOREIGN KEY (TypeId) REFERENCES Poke.Type (TypeId);

ALTER TABLE Poke.Pokemon ADD
	Weight DECIMAL(6,2)

ALTER TABLE Poke.Pokemon DROP COLUMN
	Weight

DROP TABLE Poke.Pokemon

-- Constraints
--	NOT NULL		column does not accept NULL as a value
--	NULL 			column explicitly accepts NULL (NULL will be the default value)
--	PRIMARY KEY 	UNIQUE and NOT NULL within this column, by default sets a CLUSTERED INDEX
--	UNIQUE			value must be unique within this column
--	FOREIGN KEY		by default sets a NONCLUSTERED INDEX
--	CHECK 			enforces that some expression is true for every row
--	DEFAULT			configures a default value for that column
--	IDENTITY		this sets up an auto-incrementing DEFAULT and prevents anyone from
--					inserting their own value