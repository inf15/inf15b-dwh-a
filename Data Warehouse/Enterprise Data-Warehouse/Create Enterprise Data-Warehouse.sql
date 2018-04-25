CREATE DATABASE IF NOT EXISTS enterprise_data_warehouse;
USE enterprise_data_warehouse;

create table H_KFZ (
	hash_key VARCHAR(64),
	versicherung_id VARCHAR(8),
	load_dts DATE,
	record_source VARCHAR(60),
	CONSTRAINT `pk_h_k_kfz` PRIMARY KEY (hash_key)
);

create table S_KFZ_LEISTUNG (
	kfz_hash VARCHAR(64),
	vollkasko VARCHAR(1),
	kfz_kennzeichen VARCHAR(9),
	art VARCHAR(1),
	neuwert DECIMAL(12,2),
	erstzulassung DATE,
	schadesumme_sach DECIMAL(12,2),
	schadensumme_person DECIMAL(12,2),
	versicherung_beginn DATE,
	teikasko_selbstbeteiligung DECIMAL(12,2),
	vollkasko_selbstbeteiligung DECIMAL(12,2),
	load_dts DATE,
	record_source VARCHAR(60),
	detail_hash_diff VARCHAR(64),
	CONSTRAINT `pk_s_kfz_leistung` PRIMARY KEY (detail_hash_diff, load_dts, kfz_hash)
);

create table S_KFZ_RATEN (
	kfz_hash VARCHAR(64),
	haftpflicht_rate DECIMAL(12,2),
	teilkasko_rate DECIMAL(12,2),
	vollkasko_rate DECIMAL(12,2),
	haftpflicht_rabatt_satz INTEGER,
	teilkasko_rabatt_satz INTEGER,
	vollkasko_rabatt_satz INTEGER,
	load_dts DATE,
	record_source VARCHAR(60),
	detail_hash_diff VARCHAR(64),
	CONSTRAINT `pk_s_kfz_raten` PRIMARY KEY(detail_hash_diff, load_dts, kfz_hash)
);

create table H_KUNDEN (
	hash_key VARCHAR(64),
	kunde_id VARCHAR(6),
	load_dts DATE,
	record_source VARCHAR(60),
	CONSTRAINT `pk_s_h_kunden` PRIMARY KEY (hash_key)
);

create table S_KUNDE_PERSOENLICHE_INFORMATION (
	kunde_hash VARCHAR(64),
	name VARCHAR(200),
	vorname_1 VARCHAR(200),
	vorname_2 VARCHAR(200),
	geburtstag DATE,
	geburtsort VARCHAR(200),
	familien_stand VARCHAR(200),
	anzahl_kinder INTEGER,
	load_dts DATE,
	record_source VARCHAR(60),
	detail_hash_diff VARCHAR(64),
	CONSTRAINT `pk_s_kunde_informationen` PRIMARY KEY (detail_hash_diff, load_dts, kunde_hash)
);

create table S_KUNDE_STATUS (
	kunde_hash VARCHAR(64),
	prioritaet VARCHAR(1),
	anzahl_kinder_mv INTEGER,
	ehepartner_mv VARCHAR(1),
	load_dts DATE,
	record_source VARCHAR(60),
	detail_hash_diff VARCHAR(64),
	CONSTRAINT `pk_s_kunde_status` PRIMARY KEY (detail_hash_diff, load_dts, kunde_hash)
);

create table S_KUNDE_ADRESSE (
	kunde_hash VARCHAR(64),
	strasse VARCHAR(200),
	hausnummer VARCHAR(200),
	plz VARCHAR(200),
	ort VARCHAR(200),
	telefon_privat VARCHAR(200),
	telefon_arbeit VARCHAR(200),
	mobil VARCHAR(200),
	fax VARCHAR(200),
	email_1 VARCHAR(200),
	email_2 VARCHAR(200),
	load_dts DATE,
	record_source VARCHAR(60),
	detail_hash_diff VARCHAR(64),
	CONSTRAINT `pk_s_kunde_adresse` PRIMARY KEY (detail_hash_diff, load_dts, kunde_hash)
);

create table L_KUNDE_KFZ(
	hash_key VARCHAR(64),
	kunde_hash VARCHAR(64),
	kfz_hash VARCHAR(64),
	load_dts DATE,
	record_source VARCHAR(60),
	CONSTRAINT `pk_l_kfz_kunde` PRIMARY KEY (hash_key)
);

create table H_SACH(
	hash_key VARCHAR(64),
	versicherung_id VARCHAR(8),
	load_dts DATE,
	record_source VARCHAR(60),
	CONSTRAINT `pk_h_sach` PRIMARY KEY (hash_key)
);

create table S_SACH_LEISTUNG (
	sach_hash VARCHAR(64),
	versicherung_beginn DATE,
	laufzeit INTEGER,
	kuendigungsfrist INTEGER,
	versicherungswert DECIMAL(12,2),
	art VARCHAR(3),
	load_dts DATE,
	record_source VARCHAR(60),
	detail_hash_diff VARCHAR(64),
	CONSTRAINT `pk_s_sach_leistung` PRIMARY KEY (detail_hash_diff, load_dts, sach_hash)
);

create table S_SACH_RATEN (
	sach_hash VARCHAR(64),
	monat_rate DECIMAL(12,2),
	quartal_rate DECIMAL(12,2),
	jahr_rate DECIMAL(12,2),
	zahlungsweise VARCHAR(1),
	load_dts DATE,
	record_source VARCHAR(60),
	detail_hash_diff VARCHAR(64),
	CONSTRAINT `pk_s_sach_raten` PRIMARY KEY (detail_hash_diff, load_dts, sach_hash)
);

create table L_KUNDE_SACH (
	hash_key VARCHAR(64),
	kunde_hash VARCHAR(64),
	sach_hash VARCHAR(64),
	load_dts DATE,
	record_source VARCHAR(60),
	CONSTRAINT `pk_l_kunde_sach` PRIMARY KEY (hash_key)
);

create table H_KV (
	hash_key VARCHAR(64),
	versicherung_id VARCHAR(200),
	load_dts DATE,
	record_source VARCHAR(60),
	CONSTRAINT `pk_h_kv` PRIMARY KEY (hash_key)
);

create table S_KV_LEISTUNG (
	kv_hash VARCHAR(64),
	versicherung_beginn DATE,
	monat_rate DECIMAL(12,2),
	beteiligung_rate DECIMAL(12,2),
	art VARCHAR(200),
	jaehrliche_rueckerstattung_1 DECIMAL(12,2),
	jaehrliche_rueckerstattung_2 DECIMAL(12,2),
	jaehrliche_rueckerstattung_3 DECIMAL(12,2),
	load_dts DATE,
	record_source VARCHAR(60),
	detail_hash_diff VARCHAR(64),
	CONSTRAINT `pk_s_kv_leistung` PRIMARY KEY (detail_hash_diff, load_dts, kv_hash)
);

create table L_KUNDE_KV (
	hash_key VARCHAR(64),
	kunde_hash VARCHAR(64),
	kv_hash VARCHAR(64),
	load_dts DATE,
	record_source VARCHAR(60),
	CONSTRAINT `pk_l_kunde_kv` PRIMARY KEY (hash_key)
);

create table H_LV (
	hash_key VARCHAR(64),
	versicherung_id VARCHAR(8),
	load_dts DATE,
	record_source VARCHAR(60),
	CONSTRAINT `pk_h_lv` PRIMARY KEY (hash_key)
);

create table S_LV_RATEN (
	lv_hash VARCHAR(64),
	monat_rate DECIMAL(12,2),
	quartal_rate DECIMAL(12,2),
	halbjahr_rate DECIMAL(12,2),
	jahr_rate DECIMAL(12,2),
	zahlungsweise VARCHAR(1),
	load_dts DATE,
	record_source VARCHAR(60),
	detail_hash_diff VARCHAR(64),
	CONSTRAINT `pk_s_lv_raten` PRIMARY KEY (detail_hash_diff, load_dts, lv_hash)
);

create table S_LV_LEISTUNG (
	lv_hash VARCHAR(64),
	beguenstigter VARCHAR(2),
	versicherung_beginn DATE,
	DAUER INTEGER,
	load_dts DATE,
	record_source VARCHAR(60),
	detail_hash_diff VARCHAR(64),
	CONSTRAINT `pk_s_lv_leistung` PRIMARY KEY (detail_hash_diff, load_dts, lv_hash)
);

create table L_KUNDE_LV (
	hash_key VARCHAR(64),
	kunde_hash VARCHAR(64),
	lv_hash VARCHAR(64),
	load_dts DATE,
	record_source VARCHAR(60),
	CONSTRAINT `pk_l_kunde_lv` PRIMARY KEY (hash_key)
);

create table H_BU (
	hash_key VARCHAR(64),
	versicherung_id VARCHAR(8),
	load_dts DATE,
	record_source VARCHAR(60),
	CONSTRAINT `pk_h_bu` PRIMARY KEY (hash_key)
);

create table S_BU_RATEN (
	bu_hash VARCHAR(64),
	wertbetrag DECIMAL(12,2),
	monat_rate DECIMAL(12,2),
	quartal_rate DECIMAL(12,2),
	halbjahr_rate DECIMAL(12,2),
	jahr_rate DECIMAL(12,2),
	zahlungsweise VARCHAR(200),
	load_dts DATE,
	record_source VARCHAR(60),
	detail_hash_diff VARCHAR(64),
	CONSTRAINT `pk_s_bu_raten` PRIMARY KEY (detail_hash_diff, load_dts, bu_hash)
);

create table L_LV_BU (
	hash_key VARCHAR(64),
	lv_hash VARCHAR(64),
	bu_hash VARCHAR(64),
	load_dts DATE,
	record_source VARCHAR(60),
	CONSTRAINT `pk_l_lv_bu` PRIMARY KEY (hash_key)
);
