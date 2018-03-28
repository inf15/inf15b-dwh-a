# Data-Warehouse Projekt INF15B - Gruppe A

Dies ist das Repository für das Data-Warehouse Projekt der Gruppe A der INF15B.

___
## Pentaho Data-Integration (ETL-Tool)

Als ETL-Tool verwenden wir "Pentaho Data-Integration".
Das Tool kann [hier](https://sourceforge.net/projects/pentaho/files/latest/download?source=files) heruntergeladen werden.

Die Dokumentation dazu findet sich [hier](https://help.pentaho.com/Documentation/8.0/Products/Data_Integration).

**Wichtig:** Zur Anbindung von Datenbanken müssen manuell _.jar_'s hinzugefügt werden. 
* Im Falle der MariaDb kann die Datei [hier](https://downloads.mariadb.org/connector-java/) heruntergeladen werden.
* Nach dem herunterladen muss die _.jar_ entpackt und in den _lib_-Ordner des "Pentaho Data-Integration"-Tools abgelegt werde.
* Nach einem Neustart des Tools können nun MariaDb's angebunden werden.