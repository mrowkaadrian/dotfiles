import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.bar.modules.clock
import qs.bar.modules.workspaces
import qs.bar.modules.session

PanelWindow {
    required property var modelData
    screen: modelData

    anchors { top: true; left: true; right: true }
    implicitHeight: Appearance.barHeight
    color: Colors.base

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 14
        anchors.rightMargin: 14
        spacing: 8

        Workspaces {}
        Clock {}

        Item { Layout.fillWidth: true }

        SessionMenu {}
    }

    Rectangle {
        anchors { left: parent.left; right: parent.right; bottom: parent.bottom }
        height: 1
        color: Colors.surface1
    }
}