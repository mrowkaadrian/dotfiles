import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

RowLayout {
    id: root
    spacing: 6

    readonly property int perMonitor: 5
    readonly property int monitorCount: 2

    Repeater {
        model: root.perMonitor * root.monitorCount

        RowLayout {
            id: entry
            spacing: 6

            required property int index

            readonly property int wsId: index + 1
            readonly property var ws: Hyprland.workspaces.values.find(w => w.id === wsId)
            readonly property bool isActive: Hyprland.focusedWorkspace?.id === wsId

            readonly property bool monitorBoundary: index > 0 && (index % root.perMonitor === 0)

            // Extra gap between monitor groups
            Item {
                visible: entry.monitorBoundary
                Layout.preferredWidth: 12
                Layout.preferredHeight: 1
            }

            Rectangle {
                id: workspaceButton

                readonly property int inactiveWidth: label.implicitWidth + 14
                readonly property int activeWidth: label.implicitWidth + 30

                implicitWidth: entry.isActive ? activeWidth : inactiveWidth
                implicitHeight: 22
                radius: 6

                color: entry.isActive
                    ? Colors.mauve
                    : (entry.ws ? Colors.surface0 : "transparent")

                Behavior on implicitWidth { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }
                Behavior on color { ColorAnimation { duration: 150 } }

                Text {
                    id: label
                    anchors.centerIn: parent
                    text: entry.wsId
                    color: entry.isActive
                        ? Colors.crust
                        : (entry.ws ? Colors.text : Colors.overlay0)
                    font { family: "SF Mono"; pixelSize: 14; weight: 500 }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("hl.dsp.focus({ workspace = " + entry.wsId + " })")
                }
            }
        }
    }
}