# INOFFICIAL Template for the University of Applied Science RheinMain in Wiesbaden (HSRM - Hochschule RheinMain)
_This is the template I used for my bachelorthesis. There is no warranty for anything._

__This template is _INOFFICIAL_ and may help you to design your own template.__

Thanks to [iNeedCode](https://github.com/iNeedCode/latex_template) for the examples, I think the root of this template belongs to him.

## Anmerkungen
- Die Vorlage ist, durch den breiteren Rand links, für den einseitigen Druck gedacht.
- `disable` das `easy-todo` Paket vor dem finalen Bauen
- Benutze UTF-8 für deine TeX-Dateien
- Nutze ggf. die HSRM-Farben oder die anderen Farben, diese sind im Header definiert
- Zum bauen rufe auf:
  - `pdflatex *.tex`
  - `bibtex`
  - `pdflatex *.tex`
  - `bibtex`
  - `pdflatex *.tex`
  - `pdflatex *.tex`

## Aufbau
- .build
  - Dies ist der Ordner in dem der Code liegt zum Bauen des Projektes
  - hier liegt unter anderem die `.gitlab-ci.yml` Beispieldatei zum automatisierten bauen auf gitlab.com.
- .gitignore
  - [.gitignore-Doku](https://git-scm.com/docs/gitignore)
- bachelorthesis.pdf
  - Dies ist eine das erstellte Dokument in PDF-Form. Hier im Repo ist die PDF-Datei mit Beispielen gefüllt.
- bachelorthesis.tex
  - Dies ist die _zentrale_ TeX-Datei. Nur diese muss zum Bauen bei pdflatex angegeben werden. Aktuell ist die Datei mit Beispielen gefüllt, siehe bachelorthesis.pdf
- chapter
  - Hier liegen alle TeX-Dateien der einzelnen Kapitel
- literatur.bib
  - Diese Datei enthält alle Quellangaben. Zur bequen Verwaltung verwende ich das Tool [JabRef](http://www.jabref.org)
- media
  - In diesem Ordner sind sollten alle Bilder etc gelagert werden.
- readme.md
  - Dies ist diese Datei und kann ggf. entfernt werden.

## Verwendung
### Setup
Lade dieses Repo als ZIP herrunter (oben rechts) oder checke das Repo mit [`git clone https://github.com/aeimer/latex-template-hsrm-bachelorthesis.git`](https://github.com/aeimer/latex-template-hsrm-bachelorthesis.git), anschließend kannst du die den `.git`-Ordner, das `LICENSE`-File und ggf. diese `readme.md` löschen.

Nun lade dir ggf. [JabRef](http://www.jabref.org) herunter, die Datei kannst du direkt in dem Ordner speichern, sie ist in der `.gitignore` schon enthalten.
Falls du keine Versionierung für deine Arbeit brauchst, kannst du die `.gitignore` ebenfalls löschen.
Andernfalls solltest du nun ein neues Repo anlegen, falls du Gitlab[(.com)](https://gitlab.com) verwenden möchtest, kannst du die `.gitlab-ci.yml` aus dem `.build`-Ordner in dein Projekt-Root kopieren (.dist-Endung dabei entfernen) und anpassen. Danach sollte, falls alles richtig konfiguriert ist, bei jedem Push auf den Masterbranch ein Build über die Gitlab-CI-Runner laufen. Dieser "Server"-Build zählt dir dann auch alle Wörter in dem Dokument. Die PDF und das Zählergebniss ist dann bei den Buildartifacts einsehbar.

### Lokales bauen
Während des Schreibens ist es natürlich Sinnvoll das Dokument ab und zu lokal zu bauen, um sich das Ergebnis anschauen zu können. Hierzu kannst du entweder die eingebauten Funktionen deines Editors verwenden oder auf der Konsole im Projekt-Root `pdflatex *.tex` aufrufen oder aus dem Projekt-Root `bash .build/build.sh [nobib]` aufrufen. Der Parameter `nobib` lässt dabei das Ausführen von Bibtex weg, somit wird der Buildprozess verkürzt.

## Mithilfe
Falls du Vorschläge zur Verbesserung hast, freue ich mich über deinen (gesquashten) Pull-Request. :)
