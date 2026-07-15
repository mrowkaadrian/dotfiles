import Quickshell
import Quickshell.Hyprland
import QtQuick
import qs.config
import qs.components

Item {
    id: root

    readonly property int perMonitor: 5
    property bool open: false

    implicitWidth: pill.implicitWidth
    implicitHeight: pill.implicitHeight

    Pill {
        id: pill
        anchors.fill: parent
        hPadding: Appearance.padding.normal
        fixedWidth: 100
        highlighted: root.open || mouse.containsMouse

        WorkspaceGrid {
            perMonitor: root.perMonitor
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.open = !root.open
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