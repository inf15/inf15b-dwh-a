# Anforderungsdokumentation

## Funktionale Anforderungen

* Landing-Zone
  * Es soll eine Landing-Zone implementiert und bereitgestellt werden, welches das Einlesen von Versicherungsdatendumps in der bereitgestellten Form ermöglicht.
  * Die entsprechenden ETL-Mappings von der Eingabedatei zur Landing-Zone sollen bereitgestellt werden.

* Core-Data-Warehouse
  * Es soll ein Core-Data-Warehouse implementiert und bereitgestellt werden, welches die vorliegenden Daten in geeigneter Form präsentiert. Es soll das Data-Vault Modell verwendet werden.
  * Die entsprechenden ETL-Mappings von der Staging-Area zum Core-Data-Warehouse sollen bereitgestellt werden.

* Data-Mart 
  * Es soll ein Data-Mart implementiert und bereitgestellt werden, welcher die auswertbaren Daten in einer geeigneten Form darstellt. Es soll ein Sternschema verwendet werden.
  * Die entsprechenden ETL-Mappings vom Core-Data-Warehouse zum Data-Mart sollen bereitgestellt werden.

* Reporting
  * Es soll ein Report mit der Gesamtübersicht der Kundenversicherungen als PDF erstellt werden.
  * Es soll ein Report mit den zukünftigen Auszahlungen aus Lebensversicherungen als PDF erstellt werden.
  * Es soll ein Report mit kundenbezogenen Sachversicherungen als PDF erstellt werden.
  * Es soll ein zusätzlicher Report als PDF erstellt werden.
    * Vorschlag: Trend KFZ-Zulassung und Versicherungen



## Nicht-funktionale Anforderungen

* Korrektheit der Reports


## Projektbezogene Rückfragen

* In welcher Form soll das Reporting erfolgen, nur als PDF?
  * Nicht funktionale Anforderungen in Bezug auf das Reporting?

* Gesamtübersicht-Report: Welche Daten soll die Gesamtübersicht beinhalten? Nach welchen Kritierien soll hier zusammengefasst werden?

* Zukunftsauszahlungen-Report: Auf Basis welchen Zeitraums und welcher Gruppierung soll die Schätzung erstellt werden?

* Sachversicherung-Report: Was ist mit kundenbezogen gemeint? Wie sollen die Kunden zusammengefasst werden?

## Fachliche Rückfragen
 * ETL von Landing- zu Integration-Zone: Bei Fehlererkennung, wird der komplette Datensatz entfernt?
 * Was geschieht mit den Daten in den Fehlertabellen der Integration-Zone?