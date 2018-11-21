import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    property var elem
    property var border
    property var rootLine
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All


}
