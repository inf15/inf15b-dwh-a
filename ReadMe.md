# Data-Warehouse Projekt INF15B - Gruppe A

Dies ist das Repository für das Data-Warehouse Projekt der Gruppe A der INF15B.
___

## Pentaho Data-Integration (ETL-Tool)

Als ETL-Tool verwenden wir die Enterprise-Edition der "Pentaho Data-Integration".
Die Trial-Version kann [hier](https://www.hitachivantara.com/en-us/products/big-data-integration-analytics/pentaho-trial-download.html) heruntergeladen werden.

Die Dokumentation dazu findet sich [hier](https://help.pentaho.com/Documentation/8.0/Products/Data_Integration).

Ein Tutorial zur Verwendung des Tools findet sich [hier](https://www.acando.de/fileadmin/redaktion/was-wir-tun/digital-strategy-and-transformation/pentaho/pentaho-anleitung.pdf).

**Wichtig:** Zur Anbindung von Datenbanken müssen manuell _.jar_'s hinzugefügt werden.
* Im Falle der MariaDb kann die _.jar_-Datei [hier](https://downloads.mariadb.org/connector-java/), bzw. [direct](https://downloads.mariadb.com/Connectors/java/connector-java-2.2.3/) heruntergeladen werden.
* Nach dem herunterladen muss die _.jar_ entpackt und in den _lib_-Ordner des "Pentaho Data-Integration"-Tools abgelegt werde.
* Nach einem Neustart des Tools können nun MariaDb's angebunden werden.
___
## Big Picture

Jede Zone wird in der MariaDb durch eine eigene Datenbank abgebildet und durch einen Job befüllt.
Dies ermöglicht eine höhere Flexibilität bei der Strukturierung und Verwendung der einzelnen Zonen.
Bei jeder Durchführung eines Jobs können dadurch Tabellen in der Staging-Area können zuerst alle Tabellen gedroppt und danach neuaufgebaut werden.
Dadurch werden Altdaten entfernt und Änderungen müssen nicht an bestehenden Tabellen durchgeführt werden.

### 1. Landing Zone (Staging-Area)

Die Landing-Zone ist der erste Teil der Staging-Area und zur 1:1 Aufnahme der Rohdaten notwendig.
Daten werden unverändert und unbeachtet des Inhalts aus dem Quellsystem in das DBMS geladen.

Der Landing-Job leert zuerst die Datenbank komplett und lad danach die Daten aus dem Quellsystem unverändert in die entsprechenden Tabellen.

| Datenbank    | Job         | Skripte                    | ETL                   |
|--------------|-------------|----------------------------|-----------------------|
| landing_zone | landing.kjb | Recreate Landing Zone.sql  | source-to-landing.krt |

### 2. Integration Zone (Staging-Area)

Die Integration-Zone bildet den zweiten Teil des Data-Warehouses und bereitet die Daten zur Übenahme ins Enterprise-Data-Warehouse vor.
Dies geschieht durch Transformationen und einfache Fehlerprüfungen.

Der Integration-Job leert zuerst die Datenbank komplett.
Dann werden die vorliegenden Daten aus der **Landing Zone** gelesen und entsprechende Typ-Transformationen durchgeführt.
Danach werden die Daten in die ensprechenden Tabellen der Integration Zone geladen.

Fehlgeschalgene Transformationen bedeuten fehlerhafte Daten.
Fehlerhafte Daten werden auch durch eingebaute Fehlerprüfungen erkannt.
Fehlerhafte Daten werden in jedem Fall in die Fehlertabellen der Integration-Zone geladen.

Falls sich der Fehler korrigieren lässt, wird der korrigierte Datensatz noch in die entsprechende Integrationstabelle eingefügt.
Der fehlerhafte Datensatz bleibt aber auf jeden Fall auch in der Fehlertabelle erhalten.

| Datenbank        | Job             | Skripte                       | ETL                        |
|------------------|-----------------|-------------------------------|----------------------------|
| integration_zone | integration.kjb | Recreate Integration Zone.sql | landing-to-integration.krt |

### 3. Enterprise Data-Warehouse

Das Enterprise Data-Warehouse bildet das Herzstück des Data-Warehouse und bildet die Daten entsprechend der Businesssicht ab.
Daten bleiben hier dauerhaft erhalten.

Der Job baut die Tabellen auf, falls diese noch nicht vorliegen.
Die Hauptaufgabe des Jobs ist das Laden der Daten aus der **Integration-Zone** und des "einsortieren" der Daten in das Enterprise Data-Warehouse.

Business-Keys müssen gebildet werden und mit den bestehenden Keys in den Tabellen abgeglichen werden.
Für nicht existierende Keys müssen Einträge im jeweiligen Hub und ggf. Link angelegt werden.

Daten werden in die Satelliten geschrieben.
Daten werden **nicht** überschrieben, sondern ein neuerer Eintrag hinzugefügt.
Ein neuer Eintrag soll nur angelegt werden, wenn Daten sich geändert haben.
Zum Einfachen Abgleich können dazu die Felder mit Trennzeichen (!) konkateniert und gehasht.
Der Hash kann mit der Spalte "Detail Hash Diff" abgeglichen werden, um Unterschiede zu erkennen.  
Falls keine Änderung vorliegt wird auch kein neuer Eintrag angelegt.

| Datenbank                 | Job                           | Skripte                             | ETL                        |
|---------------------------|-------------------------------|-------------------------------------|----------------------------|
| enterprise_data_warehouse | integration_to_enterprise_data_warehouse.kjb | Create Enterprise Data-Warehouse.sql | KUNDEN-integration-to-dwh.ktr |
| | | | BU-integration-to-dwh.ktr |
| | | | KFZ-integration-to-dwh.ktr |
| | | | KV-integration-to-dwh.ktr |
| | | | LV-integration-to-dwh.ktr |
| | | | SACH-integration-to-dwh.ktr |


### 4. Data-Mart

Der Data-Mart enthält die für das Reporting vorbereitete Daten.
Mit jeder Auswertung werden die Daten hier aktualisiert.

Der Data-Mart wird im Sternschema aufgebaut, die Tabelle im Zentrum des Stern ist die *Fakten-Tabelle* und
die Tabellen um diese herum sind *Dimensions-Tabellen*. 

![Data-Mart](https://raw.githubusercontent.com/inf15/inf15b-dwh-a/master/Dokumentation/Datenmodelle/data-mart.png)

**Dimensions-Tabellen** beinhalten die Details für eine Kombination der Eigenschaften Dimension (z.B. *Tag*, *Woche*, *Monat*, *Jahr* für eine Zeitdimension).

**Fakten-Tabellen** enthalten konkrete Kennzahlen für gegebene Dimensionen (z.B. *Zeit* und *Region* als Dimension und *Anzahl Verkäufe* als Fakt.).

Über einen *SELECT* mit *Equi-Join* können dann Fakten für beliebig gewählte Dimensionen aggregiert werden.

| Datenbank | Job                                        | Skripte              | ETL   |
|-----------|--------------------------------------------|----------------------|-------|
| data_mart | enterprise_data_warehouse_to_data_mart.kjb | Create Data-Mart.sql | *TBD* |

### 5. Reporting

Das Reporting erfolgt mit der Analysesoftware [Tableau](https://www.tableau.com).
Studentenlizenzen können [hier](https://www.tableau.com/academic/students) beantragt werden.
