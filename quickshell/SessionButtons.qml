import Quickshell
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    property int confirmIndex: -1
    signal closeRequested()

    function reset() { confirmIndex = -1 }

    RowLayout {
        anchors.centerIn: parent
        spacing: 12

        Repeater {
            model: [
                { glyph: "↻", label: "Restart",  accent: Colors.yellow, command: ["systemctl", "reboot"] },
                { glyph: "⏻", label: "Shutdown", accent: Colors.red,    command: ["systemctl", "poweroff"] }
            ]

            SessionTile {
                required property var modelData
                required property int index

                glyph: modelData.glyph
                label: modelData.label
                accent: modelData.accent
                confirming: root.confirmIndex === index

                onArmRequested: root.confirmIndex = index
                onCancelled: root.reset()
                onConfirmed: {
                    root.reset()
                    root.closeRequested()
                    Quickshell.execDetached(modelData.command)
                }
            }
        }
    }
}