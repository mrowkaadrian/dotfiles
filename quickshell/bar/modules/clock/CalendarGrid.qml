pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import qs.config

ColumnLayout {
    id: root

    property date viewDate: new Date()
    property date selectedDate: new Date()

    signal dayClicked(date day)

    readonly property var weekdays: ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]

    readonly property date gridStart: {
        const first = new Date(root.viewDate.getFullYear(), root.viewDate.getMonth(), 1);
        const offset = (first.getDay() + 6) % 7;
        return new Date(first.getFullYear(), first.getMonth(), 1 - offset);
    }

    spacing: 6

    RowLayout {
        Layout.fillWidth: true
        spacing: 2

        Repeater {
            model: root.weekdays

            Text {
                required property string modelData
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                text: modelData
                color: Colors.overlay1
                font { family: Appearance.font.family; pixelSize: Appearance.font.small; weight: 600 }
            }
        }
    }

    GridLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        columns: 7
        rowSpacing: 2
        columnSpacing: 2

        Repeater {
            model: 42 // 6 weeks

            Rectangle {
                id: cell
                required property int index

                readonly property date cellDate: new Date(
                    root.gridStart.getFullYear(),
                    root.gridStart.getMonth(),
                    root.gridStart.getDate() + index)

                readonly property bool inMonth: cellDate.getMonth() === root.viewDate.getMonth()
                readonly property bool isToday: cellDate.toDateString() === new Date().toDateString()
                readonly property bool isSelected: cellDate.toDateString() === root.selectedDate.toDateString()

                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: Appearance.radius.small

                color: isSelected ? Colors.mauve
                     : mouse.containsMouse ? Colors.surface0
                     : "transparent"
                Behavior on color { ColorAnimation { duration: Appearance.anim.fast } }

                border.width: 1
                border.color: (cell.isToday && !cell.isSelected) ? Colors.mauve : "transparent"

                Text {
                    anchors.centerIn: parent
                    text: cell.cellDate.getDate()
                    color: cell.isSelected ? Colors.crust
                         : cell.inMonth ? Colors.text
                         : Colors.surface2
                    font {
                        family: Appearance.font.family
                        pixelSize: Appearance.font.small
                        weight: cell.isToday ? 600 : 400
                    }
                }

                MouseArea {
                    id: mouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: root.dayClicked(cell.cellDate)
                }
            }
        }
    }
}