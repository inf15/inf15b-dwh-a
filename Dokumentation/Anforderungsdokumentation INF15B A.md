# Anforderungsdokumentation

Im Rahmen dieses Projekts soll ein *Data-Warehouse* zur Auswertung von Versicherungsdaten geplant und implementiert werden.

Das *Data-Warehouse* soll dabei nach der bekannten *Referenz-Architektur* aufgebaut werden.

## Funktionale Anforderungen

* Landing-Zone
  * Es soll eine Landing-Zone implementiert und bereitgestellt werden, welches das Einlesen von Versicherungsdaten aus *.xlsx*-Dateien erlaubt..
  * Die entsprechenden ETL-Mappings von der Eingabedatei zur Landing-Zone sollen bereitgestellt werden.
  * Fehlerhafte Datensätze sollen gesammelt am Ende jedes Monats an den Fachbereich weitergegeben werden.

* Core-Data-Warehouse
  * Es soll ein Core-Data-Warehouse implementiert und bereitgestellt werden, welches die vorliegenden Daten in geeigneter Form repräsentiert. Es soll das Data-Vault Modell verwendet werden.
  * Die entsprechenden ETL-Mappings von der Staging-Area zum Core-Data-Warehouse sollen bereitgestellt werden.

* Data-Mart 
  * Es soll ein Data-Mart implementiert und bereitgestellt werden, welcher die auswertbaren Daten in einer geeigneten Form darstellt. Es soll ein Sternschema verwendet werden.
  * Die entsprechenden ETL-Mappings vom Core-Data-Warehouse zum Data-Mart sollen bereitgestellt werden.

* Reporting
  * Es soll ein Report mit der Gesamtübersicht der Kundenversicherungen als PDF erstellt werden.
    * Die Darstellung soll in Form eines Tortendiagramms erfolgen.
    * Die Aufschlüsselung erfolgt dabei nach Versicherungsart.
  * Es soll ein Report mit den zukünftigen Auszahlungen aus Lebensversicherungen als PDF erstellt werden.
    * Dies soll basierend auf den bereits abgeschlossenen Lebensversicherungen geschehen.
    * Es wird von einem Rentenalter von 65 Jahren ausgegangen.
  * Es soll ein Report mit kundenbezogenen Sachversicherungen als PDF erstellt werden.
    * Die Kunden sollen nach den Gesichtspunkten *Geschlecht*, *Alter* etc. gruppiert werden.
  * Es soll ein zusätzlicher Report als PDF erstellt werden. Der zusätzliche Report wird im weiteren Laufe des Projekts festgelegt und genauer spezifiziert. Im Folgenden finden sich Vorschläge für einen solchen zusätzlichen Report.
    * Vorschlag: Trend KFZ-Zulassung und Versicherungen
    * Vorschlag: Umsatzentwicklung
    * Vorschlag: Fehleranalyse


## Nicht-funktionale Anforderungen

* Die Korrektheit der Reports muss gewährleistet werden
* Verfügbarkeit der Plattform muss von Montags bis Freitag, 8 bis 22 Uhr garantiert werden
* Reports sollen innerhalb von einer Stunde bereistehen