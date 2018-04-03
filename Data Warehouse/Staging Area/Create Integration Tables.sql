CREATE DATABASE IF NOT EXISTS data_warehouse;
USE data_warehouse;

CREATE TABLE STAMMDATEN_TRANSFORM (
	KuNr VARCHAR(6) NOT NULL PRIMARY KEY,
	Name VARCHAR(200) NOT NULL,
	Vorname VARCHAR(200) NOT NULL,
	Vorname2 VARCHAR(200),
	GebDatum DATE NOT NULL,
	GebOrt VARCHAR(200) NOT NULL,
	Strasse VARCHAR(200) NOT NULL,
	HausNr VARCHAR(200) NOT NULL,
	PLZ VARCHAR(200) NOT NULL,
	Ort VARCHAR(200) NOT NULL,
	TelPrivat VARCHAR(200),
	TelArbeit VARCHAR(200),
	TelMobil VARCHAR(200),
	Fax VARCHAR(200),
	Email1 VARCHAR(200) NOT NULL,
	Email2 VARCHAR(200),
	Prio VARCHAR(1) NOT NULL,
	FamStand VARCHAR(200) NOT NULL,
	AnzKinder NUMBER,
	AnzKinderMV NUMBER,
	EhepartnerMV BOOLEAN
);

CREATE TABLE LV_TRANSFORM (
	VNr VARCHAR(8) NOT NULL PRIMARY KEY,
	KuNr VARCHAR(6) NOT NULL,
	Wertfaktor DECIMAL(3,2) NOT NULL,
	Vbeginn DATE NOT NULL,
	Laufzeit VARCHAR(200) NOT NULL,
	Monatsrate DECIMAL(12,2) NOT NULL,
	Quartalsrate DECIMAL(12,2) NOT NULL,
	Halbjahresrate DECIMAL(12,2) NOT NULL,
	Jahresrate DECIMAL(12,2) NOT NULL,
	Beguenstigter VARCHAR(2) NOT NULL,
	BU VARCHAR(1) NOT NULL,
	Zahlungsweise VARCHAR(1) NOT NULL
);

CREATE TABLE KV_TRANSFORM (
	VNr VARCHAR(7) NOT NULL PRIMARY KEY,
	KuNr VARCHAR(6) NOT NULL,
	Art VARCHAR(200) NOT NULL,
	VBeginn DATE NOT NULL,
	Rate  DECIMAL(12,2) NOT NULL,
	SB  DECIMAL(12,2),
	R1  DECIMAL(12,2) NOT NULL,
	R2  DECIMAL(12,2) NOT NULL,
	R3  DECIMAL(12,2) NOT NULL
);

CREATE TABLE KFZ_TRANSFORM (
	VNr VARCHAR(8) NOT NULL PRIMARY KEY,
	KuNr VARCHAR(6) NOT NULL,
	KFZ_KZ VARCHAR(9) NOT NULL,
	Art VARCHAR(1) NOT NULL,
	Neuwert DECIMAL(12,2) NOT NULL,
	Erstzulassung DATE NOT NULL,
	VBeginn DATE NOT NULL,
	HP_Monat DECIMAL(12,2) NOT NULL,
	TK_Monat DECIMAL(12,2) NOT NULL,
	VK_Monat DECIMAL(12,2) NOT NULL,
	HPSatz NUMBER NOT NULL,
	TKSatz NUMBER NOT NULL,
	VKSatz NUMBER NOT NULL,
	SB_TK DECIMAL(12,2),
	SB_VK DECIMAL(12,2),
	VK VARCHAR(1) NOT NULL,
	Schadenssumme_Sach DECIMAL(12,2) NOT NULL,
	Schadenssumme_Person DECIMAL(12,2) NOT NULL
);

CREATE TABLE SACH_TRANSFORM (
	VNr VARCHAR(8) NOT NULL PRIMARY KEY,
	KuNr VARCHAR(6) NOT NULL,
	Art VARCHAR(3) NOT NULL,
	VWert DECIMAL(12,2) NOT NULL,
	VBeginn DATE NOT NULL,
	Laufzeit NUMBER NOT NULL,
	K_Frist NUMBER NOT NULL,
	Rate_Monat DECIMAL(12,2) NOT NULL,
	Rate_Quartal DECIMAL(12,2) NOT NULL,
	Rate_Halbjahr DECIMAL(12,2) NOT NULL,
	Rate_Jahr DECIMAL(12.2) NOT NULL,
	Zahlungsweise VARCHAR(1) NOT NULL
);

CREATE TABLE BU_TRANSFORM (
	VNr VARCHAR(8) NOT NULL PRIMARY KEY,
	KuNr VARCHAR(6) NOT NULL,
	Wertbetrag DECIMAL(12,2) NOT NULL,
	Rate_Monat DECIMAL(12,2) NOT NULL,
	Rate_Quartal DECIMAL(12,2) NOT NULL,
	Rate_Halbjahr DECIMAL(12,2) NOT NULL,
	Rate_Jahr DECIMAL(12.2) NOT NULL,
	Zahlungsweise VARCHAR(1) NOT NULL
);