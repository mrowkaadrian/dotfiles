import QtQuick
import qs.config

Rectangle {
    id: root

    property string glyph
    property color accent: Colors.text
    property color hoverColor: Colors.surface2
    property int glyphSize: Appearance.font.normal

    signal clicked()

    radius: Appearance.radius.small
    color: mouse.containsMouse ? hoverColor : "transparent"
    Behavior on color { ColorAnimation { duration: Appearance.anim.fast } }

    Text {
        anchors.centerIn: parent
        text: root.glyph
        color: root.accent
        font { family: Appearance.font.family; pixelSize: root.glyphSize; weight: 600 }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }
}