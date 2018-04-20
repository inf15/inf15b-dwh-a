# Data-Warehouse

Hier finden sich alle Skripte und Transformationen zum Aufbau und zur Verwendung des Data-Warehouses.

## Datenbanken

Jede Datenbank repräsentiert eine Zone des Data-Warehouses. Somit existieren folgende Datenbanken:

* landing_zone
* integration_zone
* enterprise_data_warehouse
* subject_zone

### DB-Server ändern

Um z.b. von localhost auf mariadb.smackmack.industries zu wechseln, kann in spoon
nachdem die Transformation geöffnet wurde unter dem Punkt "Database connections"
die verschiedenen dankenbanken und deren hosts konfiguriert werden.

## Tabellen

Tabellen werden über die _.sql_-Skripte aufgebaut.

Die Skripte müssen eindeutig benannt sein und eigenständig verwendbar sein (USE TABLE).

## Transformationen

ETL-Transformationen werden in _.ktr_-Dateien gespeichert.
Diese Dateien können im Pentaho Data-Integration-Toole(spoon.bat) geöffnet werden.
Alle verwendeten Pfade sollten relativ sein.

Die Benennung muss im Schema _<source-name>-to-<target-name>.ktr_ erfolgen.

## Jobs

Jobs haben die Aufgaben Transformationen vorzubereiten und durchzuführen.
Dazu gehört das evtl. Leeren und Erstellen der Datenbanken und der Tabellen.
Als Vorbereitung zur Ausführung des Jobs muss die entsprechende Datenbank bereits existieren.

ETL-Jobs werden in _.kjb_-Datien gespeichert.
Diese Dateien können im Pentaho Data-Integration-Toole(spoon.bat) geöffnet werden.
Die Benennung muss im Schema _<zone>.kjb_ erfolgen.
Alle verwendeten Pfade sollten relativ sein.
