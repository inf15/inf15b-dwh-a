# Anforderungsdokumentation - Gruppe A INF15B

Der Kunde *DHBW Mosbach Versicherung* möchte BI-Analysen auf seine Versicherungsdaten ausführen.
Als BI-Modell wurde ein *Data-Warehouse* gewählt.
Dieses soll dabei nach der bekannten *Referenz-Architektur* aufgebaut werden.
Das *Data-Warehouse* soll vom Lieferant *"INF15B - Gruppe A"*, in enger Kommunikation mit dem Kunden, analysiert, geplant und implementiert werden.
Die Dokumentation der Anforderungen findet in Form dieses Dokumentes statt.

## Sprint 1: Aufbau der Staging-Area
---

Im ersten Sprint soll die Staging-Area, bestehend aus *Landing-Zone* und *Integration-Zone*  umgesetzt werden.

Dazu gehören folgende Tasks:

  * Grobanalyse der Daten
  * Modellierung der Landing-Zone
  * Modellierung der Integration-Zone
  * SQL-Implementierung
  * ETL-Implementierung


### Funktionale Anforderungen

Die zu analysierenden Daten werden vom Fachbereich des Kunden in Microsoft Excels *.xlsx*-Dateiformat bereitgestellt. Die bereitgestellte Exceldatei beinhaltet mehrere *Sheets* mit folgenden Namen:
 * KFZ
 * Sach
 * BU
 * KV
 * LV
 * Stammdaten

Es soll eine Landing-Zone implementiert und bereitgestellt werden, welches das Einlesen von Versicherungsdaten, aus der oben definierten *.xlsx*-Datei, erlaubt.
Fehlerhafte Datensätze sollen gesammelt zum letzten Tag jeden Monats an den Fachbereich des zuständigen Quellsystems weitergegeben werden. Daten gelten als fehlerhaft, wenn mindestens eine der folgenden Bedingungen erfüllt ist:
  * Id des Eintrags existiert bereits
  * Null-Werte
  * Entspricht nicht der gelieferten Spezifikation (siehe Datei *Abkürzungen zu den Daten fürs Projektsemester.xlsx*)

Folgende konkrete Resulate sollen zum Ende des ersten Sprints, am 04.04.2018, vorliegen:

  * __Statusbericht 1__: Dokumentation des Sprints gemäß der Vorgaben
  * __Anforderungsdokumentation__: Dieses Dokument als PDF
  * __Datenmodell__ mit allen Tabellen der Staging-Area als Grafik für je Landing-Zone und Integration-Zone
  * __SQL-Skript__ zur Erstellung der notwendigen Datenbanken und Tabellen
  * __Transformation *source_to_landing*__: Pentaho-ETL, um Daten aus der Quell-Exceldatei in die Landing-Zone einzulesen  
  * __Transformation *landing_to_integration*__: Pentaho-ETL, um Daten von der Landing-Zone zu laden, transformieren und in die Integration-Zone zu schreiben.
  * __Job *source_to_staging*__: Pentaho-Job, um die Datenbank ggf. aufzubauen, Landing- und Integration-Zone zu leeren und danach die beiden Transformationen *source-to-landing* und *landing-to-integration* durchzuführen.

### Nicht-Funktionale Anforderungen

* Als ETL-Tool soll *Pentaho Data-Integration* eingesetzt werden
* Als Datenbank soll eine *MariaDB* verwendet werden
* Die Transformationen müssen in angemessener Zeit durchgeführt werden, also weniger als eine Stunde dauern
* Die Transformationen müssen von Montags bis Freitag, 8 bis 22 Uhr nutzbar sein
* Die Transformationen müssen fehlerfrei und wiederverwendbar sein

## Sprint 2: Aufbau des Enterprise-Data-Warehouse
---

Im zweiten Sprint soll das Enterprise-Data-Warehouse umgesetzt werden.
Konkret umfasst das folgende Tasks:

* Feinanalyse der Daten
* Modellierung des Enterprise-Data-Warehouse im Data-Vault-Schema
* SQL-Implementierung 
* ETL-Implementierung

### Funktionale Anforderungen

Folgende konkrete Resulate sollen zum Ende des zweiten Sprints, am 25.04.2018, vorliegen:

* __Statusbericht 2__: Dokumentation des Sprints gemäß der Vorgaben
* __Datenmodell__ mit allen Tabellen des Enterprise-Data-Warehouse als Grafik
* __SQL-Skript__ zur Erstellung der notwendigen Datenbanken und Tabellen
* __Transformationen *XX-integration_to_dwh*__: Pentaho-ETLs, um Daten aus der Integration-Zone zu laden und in das Enterprise-Data-Warehouse einzufügen.
* __Job *integration_to_enterprise-data-warehouse*__: Pentaho-Job, um die Datenbank ggf. aufzubauen, Landing- und Integration-Zone zu leeren und danach die beiden Transformationen *source-to-landing* und *landing-to-integration* durchzuführen.

### Nicht-Funktionale Anforderungen

* Das Enterprise-Data-Warehouse soll Datensätze versionieren
* Als ETL-Tool soll *Pentaho Data-Integration* eingesetzt werden
* Als Datenbank soll eine *MariaDB* verwendet werden
* Die Transformationen müssen in angemessener Zeit durchgeführt werden, also weniger als eine Stunde dauern
* Die Reaktionszeit bei einfachen Lese-Abfragen auf das E-DWH muss angemessen sein, also weniger als 5 Sekunden dauern
* Die Transformationen und das Enterprise-Data-Warehouse müssen von Montags bis Freitag, 8 bis 22 Uhr nutzbar sein
* Die Transformationen müssen fehlerfrei und wiederverwendbar sein


## Sprint 3: Aufbau des Data-Marts
---

Im dritten Sprint soll der Data-Mart umgesetzt werden. 
Konkret wurden folgende Tasks festgelegt:

* Data-Mart Modellierung im Sternschema
* SQL-Implementierung 
* ETL-Implementierung

### Funktionale Anforderungen

Folgende konkrete Resulate sollen zum Ende des dritten Sprints, am 16.05.2018, vorliegen:

* __Statusbericht 3__: Dokumentation des Sprints gemäß der Vorgaben
* __Datenmodell__ mit allen Tabellen des Data-Mart als Grafik
* __SQL-Skript__ zur Erstellung der notwendigen Datenbanken und Tabellen
* __Transformationen *dwh_to_data-mart*__: Pentaho-ETLs, um Daten aus dem Enterprise-Data-Warehouse zu laden, zu transformieren, auszuwerten und in den Data-Mart zu schreiben
* __Job *enterprise-data-warehouse_to_data-mart*__: Pentaho-Job, um die Datenbank und Tabellen, falls notwendig, aufzubauen und die notwendigen Transformationen durchzuführen

### Nicht-Funktionale Anforderungen

* Als ETL-Tool soll *Pentaho Data-Integration* eingesetzt werden
* Als Datenbank soll eine *MariaDB* verwendet werden
* Die Transformationen müssen in angemessener Zeit durchgeführt werden, also weniger als eine Stunde dauern
* Die Transformationen müssen von Montags bis Freitag, 8 bis 22 Uhr nutzbar sein
* Die Transformationen müssen fehlerfrei und wiederverwendbar sein

## Sprint 4: Durchführen des Reporting
---

Im letzten Schritt werden die, für den Kunden essentiellen, Reports erstellt. 

Konkret umfasst dies folgende Tasks:

* Anbindung des *Tableau*-Reporting-Tools 
* Erstellen der Reports

### Funktionale Anforderungen


Folgende konkrete Resulate sollen zum Ende des vierten Sprints, am 06.06.2018, vorliegen:

* __Reports__: Als PDF sollen die gewünschten Reports für den Kunden vorliegen:
  * Es soll ein Report mit der *Gesamtübersicht der Kundenversicherungen* erstellt werden.
    * Die Darstellung soll in Form eines Tortendiagramms erfolgen.
    * Die Aufschlüsselung erfolgt dabei nach Versicherungsart.
    
  * Es soll ein Report mit den *zukünftigen Auszahlungen aus Lebensversicherungen* erstellt werden.
    * Dies soll basierend auf den bereits abgeschlossenen Lebensversicherungen geschehen.
    * Es wird von einem Rentenalter von 65 Jahren ausgegangen
    * Aufsummiert bis zum jeweiligen Zeitpunkt x
    * Für 1,3,5,10,30 Jahre in der Zukunft

  * Es soll ein Report mit der *Anzahl kundenbezogenen Sachversicherungen* erstellt werden.
    * Die Kunden sollen nach den Gesichtspunkten  *Alter*, *Wohnort* etc. gruppiert werden

  * Es soll ein Report mit dem *durchschnittlichen Neuwert der versicherten KFZ* erstellt werden.
    * Die Auswertung soll nach Region erfolgen 

* __Projektberichte__: Dokumentation des Projekts aus Sicht jedes Teammitglieds
* __Liste fehlerhafter Datensätze__: Eine Liste mit den gefilterten fehlerhaften Datensätzen soll geliefert werden

### Nicht-Funktionale Anforderungen

* Als Reporting-Tool soll *Tableau* eingesetzt werden
* Als ETL-Tool soll *Pentaho Data-Integration* eingesetzt werden
* Als Datenbank soll eine *MariaDB* verwendet werden
* Die Korrektheit und Wiederverwendbarkeit der Reports und Transformationen muss gewährleistet werden
* Die Reports müssen in ebenfalls in angemessener Zeit zur Verfügung stehen, also weniger als eine Stunde dauern
* Die Transformationen müssen von Montags bis Freitag, 8 bis 22 Uhr nutzbar sein