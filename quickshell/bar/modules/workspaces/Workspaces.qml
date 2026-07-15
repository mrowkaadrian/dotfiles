import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.components

Item {
    id: root

    readonly property int perMonitor: 5
    property bool open: false

    implicitWidth: button.implicitWidth
    Layout.fillHeight: true

    Rectangle {
        id: button
        anchors.centerIn: parent
        implicitWidth: smallGrid.implicitWidth + 12
        implicitHeight: 22
        radius: Appearance.radius.small

        color: (root.open || hover.containsMouse) ? Colors.surface0 : "transparent"
        Behavior on color { ColorAnimation { duration: Appearance.anim.normal } }

        WorkspaceGrid {
            id: smallGrid
            anchors.centerIn: parent
            perMonitor: root.perMonitor
        }

        MouseArea {
            id: hover
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: root.open = !root.open
        }
    }

    MenuPopup {
        anchorItem: root
        open: root.open

        edges: Edges.Bottom | Edges.Left
        gravity: Edges.Bottom | Edges.Right

        implicitWidth: bigGrid.implicitWidth + 28
        implicitHeight: bigGrid.implicitHeight + 28

        WorkspaceGrid {
            id: bigGrid
            anchors.centerIn: parent

            perMonitor: root.perMonitor
            cellSize: 34
            cellRadius: Appearance.radius.small
            spacing: 6
            showNumbers: true
            interactive: true

            onWorkspaceClicked: wsId => {
                Hyprland.dispatch("hl.dsp.focus({ workspace = " + wsId + " })")
                root.open = false
            }
        }
    }
}