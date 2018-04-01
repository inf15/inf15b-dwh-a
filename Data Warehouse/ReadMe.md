# Data-Warehouse

Hier finden sich alle Skripte und Transformationen zum Aufbau und zur Verwendung des Data-Warehouses.

## Tabellen

Tabellen werden über die _.sql_-Skripte aufgebaut.
Die zu verwendende Datenbank heißt "data_warehouse".

Die Skripte müssen eindeutig benannt sein und eigenständig verwendbar sein (USE TABLE).

## ETL

ETL-Transformationen werden in _.ktr_-Dateien gespeichert.
Diese Dateien können im Pentaho Data-Integration-Toole(spoon.bat) geöffnet werden. 
Die zu verwendende Datenbank heißt "data_warehouse".
Alle Pfade sollten relativ sein.

Die Benennung muss im Schema _<source-name>-to-<target-name>.ktr_ benannt sein.
