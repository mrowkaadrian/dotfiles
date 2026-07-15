// components/Slider.qml
import QtQuick
import qs.config

Item {
    id: root

    property real value: 0
    property color accent: Colors.mauve

    signal moved(real value)

    // trust the local value while dragging: D-bus is not able to read the value immediately after changing
    readonly property bool dragging: mouse.pressed
    property real dragValue: 0
    readonly property real shown: Math.max(0, Math.min(1, dragging ? dragValue : value))

    implicitWidth: 90
    implicitHeight: 16

    Rectangle {
        id: track
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: 4
        radius: 2
        color: Colors.surface1

        Rectangle {
            width: track.width * root.shown
            height: parent.height
            radius: parent.radius
            color: root.accent
        }
    }

    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        x: (root.width - width) * root.shown
        width: 9
        height: 9
        radius: width / 2
        color: root.accent

        scale: (mouse.containsMouse || mouse.pressed) ? 1.4 : 1
        Behavior on scale { NumberAnimation { duration: Appearance.anim.fast } }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        preventStealing: true

        function seek(mx) {
            root.dragValue = Math.max(0, Math.min(1, mx / root.width));
            root.moved(root.dragValue);
        }

        onPressed: e => seek(e.x)
        onPositionChanged: e => { if (pressed) seek(e.x); }
    }
}