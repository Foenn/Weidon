IF OBJECT_ID ('dbo.Mythology') IS NOT NULL
	DROP TABLE dbo.Mythology
GO

CREATE TABLE dbo.Mythology
	(
	Id          INT IDENTITY NOT NULL,
	Name        VARCHAR (100),
	--Deities     VARCHAR (MAX),
	--Myths		VARCHAR (MAX),
	Content     VARCHAR (MAX),
	Area		VARCHAR (500),
	PRIMARY KEY (Id),
	)
GO


IF OBJECT_ID ('dbo.Myth') IS NOT NULL
	DROP TABLE dbo.Myth
GO

CREATE TABLE dbo.Myth
	(
	Id          INT IDENTITY NOT NULL,
	Name        VARCHAR (100),
	AlternativeNames	VARCHAR(1000),
	IdMythology	INT NOT NULL,
	Mythology	VARCHAR (500),
	Meaning		VARCHAR (MAX),
	Story		VARCHAR (MAX),
	Origin      VARCHAR (MAX),
	EquivalentMyths		VARCHAR (500),
	PRIMARY KEY (Id),
	CONSTRAINT FK_Mythology FOREIGN KEY (IdMythology) REFERENCES dbo.Mythology (Id)
	)
GO

IF OBJECT_ID ('dbo.Deity') IS NOT NULL
	DROP TABLE dbo.Deity
GO

CREATE TABLE dbo.Deity
	(
	Id          INT IDENTITY NOT NULL,
	Name        VARCHAR (100),
	AlternativeNames        VARCHAR (1000),
	Mythology	VARCHAR (500),
	IdMythology	INT NOT NULL,
	Roles		VARCHAR (500),
	Etymology	VARCHAR (MAX),
	Origin      VARCHAR (MAX),
	Symbolism   VARCHAR (MAX),
	EquivalentDeities		VARCHAR (500),
	PRIMARY KEY (Id),
	FOREIGN KEY (IdMythology) REFERENCES dbo.Mythology (Id)
	)
GO

IF OBJECT_ID ('dbo.Characters') IS NOT NULL
	DROP TABLE dbo.Characters
GO

CREATE TABLE dbo.Characters
	(
	Id          INT IDENTITY NOT NULL,
	Name        VARCHAR (100),
	IdDeity		INT,
	IdMythology	INT NOT NULL,
	Mythology	VARCHAR (500),
	Myth		VARCHAR (500),
	IdMyth		INT NOT NULL,
	PRIMARY KEY (Id),
	FOREIGN KEY (IdMyth) REFERENCES dbo.Myth (Id),
	FOREIGN KEY (IdDeity) REFERENCES dbo.Deity (Id)
	)
GO

INSERT INTO dbo.Mythology(Name, Content, Area)
VALUES ('Greek Mythology', 'The Mythology of Ancient Greece.', 'Greece, Cyprus, Macedonia, Middle East')
GO

INSERT INTO dbo.Mythology(Name, Content, Area)
VALUES ('Roman Mythology', 'The Mythology of Ancient Rome.', 'Italy, Gaul')
GO

INSERT INTO dbo.Mythology(Name, Content, Area)
VALUES ('Norse Mythology', 'The Mythology of Ancient Scandinavia.', 'Iceland, Greenland, Sweden, Denmark, Norway')
GO



INSERT INTO dbo.Myth(Name, IdMythology, Mythology, Meaning, Story)
VALUES ('Persephone''s abduction', 1, 'Greek Mythology', 'Seasons cycle', 'The story of how Persephone was abducted by Hades.')
GO

INSERT INTO dbo.Myth(Name, IdMythology, Mythology, Meaning, Story)
VALUES ('Founding of Rome', 2, 'Roman Mythology', 'Mythical creation of Rome', 'The story of the founding of Rome by Romulus and Remus.')
GO



INSERT INTO dbo.Deity(Name, AlternativeNames, Mythology, IdMythology, Roles, Etymology, EquivalentDeities)
VALUES ('Zeus', 'Zas, Aegiochos, Apemius', 'Greek Mythology', 1, 'King of the gods, Sky god, Sky father', 'Zeus comes from “Dyeus” meaning sky.', 'Jupiter, Tyr, The Dagda')
GO

INSERT INTO dbo.Deity(Name, AlternativeNames, Mythology, IdMythology, Roles, Etymology, EquivalentDeities)
VALUES ('Hades', 'Plouton', 'Greek Mythology', 1, 'King of the underworld', 'Hades comes from “Awides” meaning unseen.', 'Pluto, Dis Pater')
GO

INSERT INTO dbo.Deity(Name, AlternativeNames, Mythology, IdMythology, Roles, Etymology, EquivalentDeities)
VALUES ('Jupiter', 'Jove', 'Roman Mythology', 2, 'King of the gods, Sky god, Sky father, Authority of Rome', 'Jupiter comes from “Dyeus Pater” meaning sky god.', 'Zeus, Tyr, The Dagda')
GO

INSERT INTO dbo.Deity(Name, AlternativeNames, Mythology, IdMythology, Roles, Etymology, EquivalentDeities)
VALUES ('Thor', 'Donar, Tuner, Thuner', 'Norse Mythology', 3, 'Thunder god', 'Thor comes from “stenh” meaning thunder.', 'Perun, Taranis')
GO



INSERT INTO dbo.Characters(Name, IdDeity, IdMythology, Mythology, IdMyth, Myth)
VALUES ('Zeus', 1, 1, 'Greek Mythology', 1, 'Persephone''s abduction')
GO

INSERT INTO dbo.Characters(Name, IdDeity, IdMythology, Mythology, IdMyth, Myth)
VALUES ('Persephone', NULL, 1, 'Greek Mythology', 1, 'Persephone''s abduction')
GO

INSERT INTO dbo.Characters(Name, IdDeity, IdMythology, Mythology, IdMyth, Myth)
VALUES ('Hades', 2, 1, 'Greek Mythology', 1, 'Persephone''s abduction')
GO

INSERT INTO dbo.Characters(Name, IdDeity, IdMythology, Mythology, IdMyth, Myth)
VALUES ('Demeter', NULL, 1, 'Greek Mythology', 1, 'Persephone''s abduction')
GO

INSERT INTO dbo.Characters(Name, IdDeity, IdMythology, Mythology, IdMyth, Myth)
VALUES ('Jupiter', 3, 2, 'Roman Mythology', 2, 'Founding of Rome')
GO

INSERT INTO dbo.Characters(Name, IdDeity, IdMythology, Mythology, IdMyth, Myth)
VALUES ('Romulus', NULL, 2, 'Roman Mythology', 2, 'Founding of Rome')
GO

INSERT INTO dbo.Characters(Name, IdDeity, IdMythology, Mythology, IdMyth, Myth)
VALUES ('Remus', NULL, 2, 'Roman Mythology', 2, 'Founding of Rome')
GO

INSERT INTO dbo.Characters(Name, IdDeity, IdMythology, Mythology, IdMyth, Myth)
VALUES ('Mars', NULL, 2, 'Roman Mythology', 2, 'Founding of Rome')
GO

