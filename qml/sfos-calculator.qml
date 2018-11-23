import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "../js/Calculator.js" as Calculator

ApplicationWindow
{
    initialPage: Component { BasicModePage { calculator: Calculator } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
