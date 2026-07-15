pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Hyprland
import QtQuick
import qs.config

Grid {
    id: root

    property int perMonitor: 5
    property int cellSize: 7
    property real cellRadius: 1.5
    property bool showNumbers: false
    property bool interactive: false

    signal workspaceClicked(int wsId)

    readonly property int monitorCount: Math.max(1, Hyprland.monitors.values.length)

    columns: perMonitor
    spacing: 2

    Repeater {
        model: root.perMonitor * root.monitorCount

        Rectangle {
            id: cell
            required property int index

            readonly property int wsId: index + 1
            readonly property var ws: Hyprland.workspaces.values.find(w => w.id === cell.wsId)
            readonly property bool focused: Hyprland.focusedWorkspace?.id === cell.wsId
            readonly property bool active: cell.ws?.monitor?.activeWorkspace?.id === cell.wsId

            width: root.cellSize
            height: root.cellSize
            radius: root.cellRadius

            color: focused ? Colors.mauve
                 : active  ? Colors.lavender
                 : ws      ? Colors.overlay0
                           : Colors.surface1
            Behavior on color { ColorAnimation { duration: Appearance.anim.normal } }

            border.width: 1
            border.color: mouse.containsMouse ? Colors.text : "transparent"
            Behavior on border.color { ColorAnimation { duration: Appearance.anim.fast } }

            Text {
                anchors.centerIn: parent
                visible: root.showNumbers
                text: cell.wsId
                color: (cell.focused || cell.active) ? Colors.crust
                     : cell.ws ? Colors.text
                               : Colors.overlay1
                font { family: Appearance.font.family; pixelSize: Appearance.font.small; weight: 600 }
            }

            MouseArea {
                id: mouse
                anchors.fill: parent
                enabled: root.interactive
                hoverEnabled: root.interactive
                cursorShape: Qt.PointingHandCursor
                onClicked: root.workspaceClicked(cell.wsId)
            }
        }
    }
}