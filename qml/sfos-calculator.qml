import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "../js/Calculator.js" as Calculator
import Nemo.Configuration 1.0

ApplicationWindow
{
    id: app

    property var history: ListModel {id: historyModel}
    property var calculator: Calculator
    initialPage: Component { BasicModePage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
    ConfigurationValue{

        id:config
        key:"calculatorMode"
        value:"basic"
        Component.onCompleted: {
            sync()
            switch(value){
            case "basic":
                app.initialPage=Qt.resolvedUrl("pages/BasicModePage.qml");
                break;
            case "engineering":
                app.initialPage=Qt.resolvedUrl("pages/EngineeringModePage.qml");
                break;
            case "graph":
                app.initialPage=Qt.resolvedUrl("pages/GraphBuilder.qml");
                break;
            }
            console.log(value)
        }
    }
}
