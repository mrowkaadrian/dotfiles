import Quickshell
import QtQuick
import qs.config
import qs.bar.modules.clock
import qs.bar.modules.workspaces
import qs.bar.modules.session

PanelWindow {
    required property var modelData
    screen: modelData

    anchors { top: true; left: true; right: true }
    implicitHeight: Appearance.bar.height
    color: "transparent"

    Workspaces {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: Appearance.bar.margin
    }

    Clock {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    SessionMenu {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: Appearance.bar.margin
    }
}