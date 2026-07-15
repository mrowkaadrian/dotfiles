import QtQuick
import QtQuick.Layouts

Rectangle {
    id: tile

    property string glyph
    property string label
    property color accent
    property bool confirming: false

    signal armRequested()
    signal confirmed()
    signal cancelled()

    implicitWidth: 80
    implicitHeight: 86
    radius: 10

    color: (faceHover.containsMouse && !confirming) ? Colors.surface1 : Colors.surface0
    Behavior on color { ColorAnimation { duration: 150 } }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 8

        opacity: tile.confirming ? 0 : 1
        visible: opacity > 0
        Behavior on opacity { NumberAnimation { duration: 130 } }

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: tile.glyph
            color: faceHover.containsMouse ? tile.accent : Colors.subtext0
            font { family: "SF Mono"; pixelSize: 22 }
            Behavior on color { ColorAnimation { duration: 150 } }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: tile.label
            color: faceHover.containsMouse ? Colors.text : Colors.subtext0
            font { family: "SF Mono"; pixelSize: 11; weight: 500 }
            Behavior on color { ColorAnimation { duration: 150 } }
        }
    }

    MouseArea {
        id: faceHover
        anchors.fill: parent
        hoverEnabled: true
        enabled: !tile.confirming
        cursorShape: Qt.PointingHandCursor
        onClicked: tile.armRequested()
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 6
        spacing: 6

        opacity: tile.confirming ? 1 : 0
        visible: opacity > 0
        Behavior on opacity { NumberAnimation { duration: 130 } }

        Repeater {
            model: [
                { glyph: "✓", accent: Colors.green, confirm: true },
                { glyph: "✕", accent: Colors.red,   confirm: false }
            ]

            Rectangle {
                id: choice
                required property var modelData

                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 8

                color: choiceHover.containsMouse ? Colors.surface2 : "transparent"
                Behavior on color { ColorAnimation { duration: 120 } }

                Text {
                    anchors.centerIn: parent
                    text: choice.modelData.glyph
                    color: choice.modelData.accent
                    font { family: "SF Mono"; pixelSize: 16; weight: 600 }
                }

                MouseArea {
                    id: choiceHover
                    anchors.fill: parent
                    hoverEnabled: true
                    enabled: tile.confirming
                    cursorShape: Qt.PointingHandCursor
                    onClicked: choice.modelData.confirm ? tile.confirmed() : tile.cancelled()
                }
            }
        }
    }
}