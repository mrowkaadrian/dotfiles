import QtQuick
import QtQuick.Layouts
import qs.config

Item {
    id: root

    property string glyph
    property string label
    property color accent
    readonly property alias hovered: mouse.containsMouse

    signal clicked()

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 8

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: root.glyph
            color: mouse.containsMouse ? root.accent : Colors.subtext0
            font { family: Appearance.font.family; pixelSize: Appearance.font.large }
            Behavior on color { ColorAnimation { duration: Appearance.anim.normal } }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: root.label
            color: mouse.containsMouse ? Colors.text : Colors.subtext0
            font { family: Appearance.font.family; pixelSize: Appearance.font.small; weight: 500 }
            Behavior on color { ColorAnimation { duration: Appearance.anim.normal } }
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }
}