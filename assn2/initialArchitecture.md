#  __SPRINT Quiz__
_Description of Component Diagram_

__Playground__
Hier läuft das Quiz ab. Diese Komponente nimmt die User-Eingaben auf, bewertet sie (falsch/richtig), steuert die Bildschirmanzeige (Begrüssung, feedback zu User-Eingaben, Verabschiedung. Die Fragen (=Question=Daten) erhält *\<<Playground\>>* von *\<<Quiz\>>* und stellt sie dar. Weitere Daten wie aktueller Punktestand werden ebenfalls von *\<<Quiz\>>* übernommen -> *Quiz-Status*.
Diese Komponente ist client-seitig.

__Quiz__ 
Diese Komponente ist für die Auswahl der Fragen inkl. Antworten etc. zuständig, ausserdem für die das gesamte Quiz betreffende Informationen (Anzahl Fragen, Punktestand, Name Spielperson). Diese Komponente greift auf *\<<DB\>>* via *QuestionList* zu. *QuestionList* bildet die verfügbaren Fragen ab.

__DB__
Diese Komponente ist gewissermassen passiv, stellt jedoch die Funktionen *change* und *delete* zur Verfügung.

__Management__
Die Aufgabe dieser Komponente ist das Verwalten von *\<<DB\>>*. Hierzu werden die Funktionen *\<<change\>>* und *\<<delete\>>* von *\<<DB\>>* genutzt.
