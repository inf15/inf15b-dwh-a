CREATE DATABASE IF NOT EXISTS data_warehouse;
USE data_warehouse;

CREATE TABLE STAMMDATEN_ERROR (
	KuNr VARCHAR(200),
	Name VARCHAR(200),
	Vorname VARCHAR(200),
	Vorname2 VARCHAR(200),
	GebDatum VARCHAR(200),
	GebOrt VARCHAR(200),
	Strasse VARCHAR(200),
	HausNr VARCHAR(200),
	PLZ VARCHAR(200),
	Ort VARCHAR(200),
	TelPrivat VARCHAR(200),
	TelArbeit VARCHAR(200),
	TelMobil VARCHAR(200),
	Fax VARCHAR(200),
	Email1 VARCHAR(200),
	Email2 VARCHAR(200),
	Prio VARCHAR(200),
	FamStand VARCHAR(200),
	AnzKinder VARCHAR(200),
	AnzKinderMV VARCHAR(200),
	EhepartnerMV VARCHAR(200)
);

CREATE TABLE LV_ERROR (
	VNr VARCHAR(200),
	KuNr VARCHAR(200),
	Wertfaktor VARCHAR(200),
	Vbeginn VARCHAR(200),
	Laufzeit VARCHAR(200),
	Monatsrate VARCHAR(200),
	Quartalsrate VARCHAR(200),
	Halbjahresrate VARCHAR(200),
	Jahresrate VARCHAR(200),
	Beguenstigter VARCHAR(200),
	BU VARCHAR(200),
	Zahlungsweise VARCHAR(200)
);

CREATE TABLE KV_ERROR (
	VNr VARCHAR(200),
	KuNr VARCHAR(200),
	Art VARCHAR(200),
	VBeginn VARCHAR(200),
	Rate VARCHAR(200),
	SB VARCHAR(200),
	R1 VARCHAR(200),
	R2 VARCHAR(200),
	R3 VARCHAR(200)
);

CREATE TABLE KFZ_ERROR (
	VNr VARCHAR(200),
	KuNr VARCHAR(200),
	KFZ_KZ VARCHAR(200),
	Art VARCHAR(200),
	Neuwert VARCHAR(200),
	Erstzulassung VARCHAR(200),
	VBeginn VARCHAR(200),
	HP_Monat VARCHAR(200),
	TK_Monat VARCHAR(200),
	VK_Monat VARCHAR(200),
	HPSatz VARCHAR(200),
	TKSatz VARCHAR(200),
	VKSatz VARCHAR(200),
	SB_TK VARCHAR(200),
	SB_VK VARCHAR(200),
	VK VARCHAR(200),
	Schadenssumme_Sach VARCHAR(200),
	Schadenssumme_Person VARCHAR(200)
);

CREATE TABLE SACH_ERROR (
	VNr VARCHAR(200),
	KuNr VARCHAR(200),
	Art VARCHAR(200),
	VWert VARCHAR(200),
	VBeginn VARCHAR(200),
	Laufzeit VARCHAR(200),
	K_Frist VARCHAR(200),
	Rate_Monat VARCHAR(200),
	Rate_Quartal VARCHAR(200),
	Rate_Halbjahr VARCHAR(200),
	Rate_Jahr VARCHAR(200),
	Zahlungsweise VARCHAR(200)
);

CREATE TABLE BU_ERROR (
	VNr VARCHAR(200),
	KuNr VARCHAR(200),
	Wertbetrag VARCHAR(200),
	Rate_Monat VARCHAR(200),
	Rate_Quartal VARCHAR(200),
	Rate_Halbjahr VARCHAR(200),
	Rate_Jahr VARCHAR(200),
	Zahlungsweise VARCHAR(200)
);