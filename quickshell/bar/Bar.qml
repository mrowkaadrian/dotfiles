import Quickshell
import QtQuick
import qs.config
import qs.bar.modules.workspaces
import qs.bar.modules.music
import qs.bar.modules.clock
import qs.bar.modules.tray
import qs.bar.modules.session

PanelWindow {
    required property var modelData
    screen: modelData

    anchors { top: true; left: true; right: true }
    implicitHeight: Appearance.bar.height
    color: "transparent"

    Workspaces {
        id: workspaces
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: Appearance.bar.margin
    }

    Music {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: workspaces.right
        anchors.rightMargin: 8
    }

    Clock {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Tray {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: session.left
        anchors.rightMargin: 8
    }

    SessionMenu {
        id: session
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: Appearance.bar.margin
    }
}