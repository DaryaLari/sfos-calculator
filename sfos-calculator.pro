# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = sfos-calculator

CONFIG += sailfishapp

SOURCES += src/sfos-calculator.cpp

DISTFILES += qml/sfos-calculator.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/sfos-calculator.changes.in \
    rpm/sfos-calculator.changes.run.in \
    rpm/sfos-calculator.spec \
    rpm/sfos-calculator.yaml \
    translations/*.ts \
    sfos-calculator.desktop \
    qml/pages/BasicModePage.qml \
    qml/pages/EngineeringModePage.qml \
    qml/assets/Display.qml \
    qml/assets/KeyBrdBtn.qml \
    qml/pages/GraphBuilder.qml \
    qml/assets/KeyBoardGraph.qml \
    qml/assets/DisplayGraph.qml \
    qml/pages/Graph.qml \
    js/Calculator.js\
    qml/assets/KeyBoardBasic.qml \
    qml/assets/KeyBoardEngineering.qml \
    qml/assets/GraphCanvas.qml\
    qml/pages/d3.js \
    js/states.js \
    qml/assets/historyDisplay.qml \
    qml/assets/Menu.qml

OTHER_FILES += js/*
js.files = js/*
js.path = /usr/share/$$TARGET/js
INSTALLS += js

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/sfos-calculator-de.ts
