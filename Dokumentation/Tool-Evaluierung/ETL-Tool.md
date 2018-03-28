# ETL-Tool

Wir haben uns dafür entschieden erstmal Pantheo zu verwenden und zu evaluieren. Die Entscheidung erfolgte auf Basis des professionellen Auftretens und der frei verfügbaren Community Edition. Sollte sich bei der ersten Anwendung herausstellen, dass das Tool ungeeignet ist, werden wir ein anderes Tool verwenden:

* [Penthao](http://www.pentaho.com/)
    - Interpreter für Prozeduren, die in XML festgelegt werden
    - Einfach zu benutzen (GUI basiert)
    - Bietet sich bei Kettle Umgebungen an
    - Ermöglicht reporting und analyse (-> BI tool)


Folgende ETL-Tools standen noch zur Auswahl:

* [Talend](https://www.talend.com/)
    - Eclipse basiert
    - Single-Threading Code Generator (Java oder Perl)
    - (Empfohlen für Leute die bereits Java programmieren und mit generator zeit sparen wollen)
    - Drag and Drop Design flow
    - viele vor-konfigurierte Elemente (~400)
    - Starker community support und gut dokumentiert

* [Scriptella](http://scriptella.org/)
    - Java
    - Einfach
    - SQL für Transformationen (-> keine XML basierte komplexe Sprache)

* KETL
    - Interpreter für Prozeduren, die in XML festgelegt werden
    - Im Gegensatz zu Code (Talend) debugt man graphische Prozeduren
    - Support für Integration von Security- und Datenmanagementtools
    - Skalierbarkeit über verschiedene Server
    - Kein Bedarf für Third-Party "schedule, dependency, and notifications tools"
    - JavaScript und Java Engine

* [Jaspersoft ETL](https://www.jaspersoft.com)
    - Einfach aufzusetzen
    - Partnerschaft mit Talend, baut darauf auf (identisch)

[JASPER VS. PENTAHO](https://www.itcentralstation.com/product_reviews/tibco-jaspersoft-review-28762-by-nikhilesh-tiwari)