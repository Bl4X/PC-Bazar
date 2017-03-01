/*
Created: 15.02.2017
Modified: 01.03.2017
Model: Oracle 11g Release 1
Database: Oracle 11g Release 1
*/

-- Create tables section -------------------------------------------------

-- Table Benutzer

CREATE TABLE "Benutzer"(
  "BenutzerID" Integer NOT NULL,
  "Benutzername" Varchar2(30 ) NOT NULL,
  "E-Mail" Varchar2(30 ) NOT NULL,
  "Passwort" Varchar2(30 ) NOT NULL,
  "Name" Varchar2(30 ) NOT NULL,
  "Vorname" Varchar2(30 ) NOT NULL,
  "Geburtstag" Date NOT NULL,
  "Ort" Varchar2(20 ) NOT NULL,
  "PLZ" Varchar2(5 ) NOT NULL,
  "Straße" Varchar2(40 ) NOT NULL,
  "Hausnummer" Varchar2(4 ) NOT NULL,
  "TelefonNr" Varchar2(30 )
)
/

-- Add keys for table Benutzer

ALTER TABLE "Benutzer" ADD CONSTRAINT "Key1" PRIMARY KEY ("BenutzerID")
/

-- Table Artikel

CREATE TABLE "Artikel"(
  "ArtikelID" Integer NOT NULL,
  "AriteklName" Varchar2(50 ) NOT NULL,
  "Beschreibung" Varchar2(400 ),
  "FotoQuelle" Varchar2(100 ),
  "Zustand" Varchar2(30 ) NOT NULL,
  "Pfandbasis" Float DEFAULT 0,
  "Model" Varchar2(50 ) NOT NULL,
  "RechnungQuelle" Varchar2(100 )
)
/

-- Add keys for table Artikel

ALTER TABLE "Artikel" ADD CONSTRAINT "Key2" PRIMARY KEY ("ArtikelID")
/

-- Table angebot

CREATE TABLE "angebot"(
  "angebotID" Integer NOT NULL,
  "BenutzerID" Integer NOT NULL,
  "ArtikelID" Integer NOT NULL,
  "Datum" Date NOT NULL
)
/

-- Add keys for table angebot

ALTER TABLE "angebot" ADD CONSTRAINT "Key2" PRIMARY KEY ("BenutzerID","ArtikelID","angebotID")
/

-- Table Mitarbeiter

CREATE TABLE "Mitarbeiter"(
  "MitarbeiterID" Integer NOT NULL,
  "Benutzername" Varchar2(30 ) NOT NULL,
  "E-Mail" Varchar2(30 ) NOT NULL,
  "Passwort" Varchar2(30 ) NOT NULL,
  "Name" Char(30 ) NOT NULL,
  "Geburtstag" Date NOT NULL,
  "Ort" Varchar2(20 ) NOT NULL,
  "PLZ" Varchar2(5 ) NOT NULL,
  "Straße" Varchar2(40 ),
  "Hausnummer" Varchar2(4 ) NOT NULL,
  "TelefonNr" Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Mitarbeiter

ALTER TABLE "Mitarbeiter" ADD CONSTRAINT "Key4" PRIMARY KEY ("MitarbeiterID")
/

-- Table SupportTicket

CREATE TABLE "SupportTicket"(
  "SupportTicketID" Integer NOT NULL,
  "BenutzerID" Integer NOT NULL,
  "MitarbeiterID" Integer NOT NULL,
  "Datum" Date NOT NULL,
  "Titel" Varchar2(30 ) NOT NULL,
  "Problembeschreibung" Varchar2(400 ) NOT NULL
)
/

-- Add keys for table SupportTicket

ALTER TABLE "SupportTicket" ADD CONSTRAINT "Key5" PRIMARY KEY ("SupportTicketID","BenutzerID","MitarbeiterID")
/

-- Table HandelsAnfrage

CREATE TABLE "HandelsAnfrage"(
  "HandelsAnfrageID" Integer NOT NULL,
  "BenutzerID" Integer NOT NULL,
  "BenutzerID" Integer NOT NULL,
  "ArtikelID" Integer NOT NULL,
  "angebotID" Integer NOT NULL,
  "Datum" Date NOT NULL,
  "ArtikelBezeichnung" Varchar2(50 ),
  "Beschreibung" Varchar2(400 ),
  "FotoQuelle" Varchar2(100 ),
  "Zustand" Varchar2(30 ),
  "Pfandbasis" Float,
  "Model" Varchar2(50 ),
  "RechnungQuelle" Varchar2(100 ),
  "Preis" Float
)
/

-- Add keys for table HandelsAnfrage

ALTER TABLE "HandelsAnfrage" ADD CONSTRAINT "Key6" PRIMARY KEY ("HandelsAnfrageID","BenutzerID","BenutzerID","ArtikelID","angebotID")
/

-- Table Transaktion

CREATE TABLE "Transaktion"(
  "TransaktionID" Integer NOT NULL,
  "HandelsAnfrageID" Integer NOT NULL,
  "BenutzerID" Integer NOT NULL,
  "BenutzerID" Integer NOT NULL,
  "ArtikelID" Integer NOT NULL,
  "angebotID" Integer NOT NULL,
  "Datum" Date NOT NULL
)
/

-- Add keys for table Transaktion

ALTER TABLE "Transaktion" ADD CONSTRAINT "Key7" PRIMARY KEY ("TransaktionID","HandelsAnfrageID","BenutzerID","BenutzerID","ArtikelID","angebotID")
/

-- Create relationships section ------------------------------------------------- 

ALTER TABLE "angebot" ADD CONSTRAINT "erstellt" FOREIGN KEY ("BenutzerID") REFERENCES "Benutzer" ("BenutzerID")
/

ALTER TABLE "SupportTicket" ADD CONSTRAINT "hat" FOREIGN KEY ("MitarbeiterID") REFERENCES "Mitarbeiter" ("MitarbeiterID")
/

ALTER TABLE "angebot" ADD CONSTRAINT "wird" FOREIGN KEY ("ArtikelID") REFERENCES "Artikel" ("ArtikelID")
/

ALTER TABLE "HandelsAnfrage" ADD CONSTRAINT "macht" FOREIGN KEY ("BenutzerID") REFERENCES "Benutzer" ("BenutzerID")
/

ALTER TABLE "HandelsAnfrage" ADD CONSTRAINT "hat" FOREIGN KEY ("BenutzerID", "ArtikelID", "angebotID") REFERENCES "angebot" ("BenutzerID", "ArtikelID", "angebotID")
/

ALTER TABLE "Transaktion" ADD CONSTRAINT "findet statt" FOREIGN KEY ("HandelsAnfrageID", "BenutzerID", "BenutzerID", "ArtikelID", "angebotID") REFERENCES "HandelsAnfrage" ("HandelsAnfrageID", "BenutzerID", "BenutzerID", "ArtikelID", "angebotID")
/

ALTER TABLE "SupportTicket" ADD CONSTRAINT "erstellt" FOREIGN KEY ("BenutzerID") REFERENCES "Benutzer" ("BenutzerID")
/




