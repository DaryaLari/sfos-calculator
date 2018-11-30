import QtQuick 2.0
import Sailfish.Silica 1.0
Item {
    PullDownMenu{
        MenuItem{
            visible: pageStack.currentPage.objectName !== "BasicModePage"
            text: qsTr("Basic mode")
            onClicked: {pageStack.replace(Qt.resolvedUrl("../pages/BasicModePage.qml"), {});
            config.value="basic"
               config.sync()
            }
        }
        MenuItem{
            visible: pageStack.currentPage.objectName !== 'EngineeringModePage'
            text: qsTr("Engineering mode")
            onClicked: {
                pageStack.replace(Qt.resolvedUrl("../pages/EngineeringModePage.qml"), {});
                config.value="engineering";
            }
        }
        MenuItem{
            visible: pageStack.currentPage.objectName !== "GraphBuilder"
            text: qsTr("Build a graph")
            onClicked: {
                pageStack.replace(Qt.resolvedUrl("../pages/GraphBuilder.qml"));
                config.value="graph";
            }
        }
        MenuItem{
            visible: pageStack.currentPage.objectName !== "History"
            text: qsTr("History")
            onClicked: {

                pageStack.push(Qt.resolvedUrl("../pages/History.qml"), {});
//                pageStack.currentPage.update()
            }
        }
    }
}
