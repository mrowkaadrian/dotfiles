pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import qs.config

ColumnLayout {
    id: root

    property date day: new Date()
    property int startHour: 8
    property int endHour: 20

    spacing: 8

    Text {
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        text: root.day.toLocaleDateString(Appearance.locale, "dddd, d MMMM")
        color: Colors.subtext0
        elide: Text.ElideRight
        font { family: Appearance.font.family; pixelSize: Appearance.font.small; weight: 600 }
    }

    ColumnLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 2

        Repeater {
            model: root.endHour - root.startHour + 1

            RowLayout {
                id: slot
                required property int index

                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 6

                Text {
                    Layout.preferredWidth: 32
                    text: String(root.startHour + slot.index).padStart(2, "0") + ":00"
                    color: Colors.overlay0
                    font { family: Appearance.font.family; pixelSize: Appearance.font.small }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.minimumHeight: 16
                    radius: 3
                    color: "transparent"
                    border.width: 1
                    border.color: Colors.surface0
                }
            }
        }
    }
}