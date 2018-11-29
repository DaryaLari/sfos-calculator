import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "../js/Calculator.js" as Calculator

ApplicationWindow
{
    id: app
    property var history: []
    property var calculator: Calculator
    initialPage: Component { BasicModePage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
