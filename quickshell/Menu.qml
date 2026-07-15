import Quickshell
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    implicitWidth: 28
    Layout.fillHeight: true

    property bool open: false

    Rectangle {
        id: button
        anchors.centerIn: parent
        implicitWidth: 28
        implicitHeight: 22
        radius: 6

        color: (root.open || hover.containsMouse) ? Colors.surface0 : "transparent"
        Behavior on color { ColorAnimation { duration: 150 } }

        Text {
            anchors.centerIn: parent
            text: "⏻"
            color: root.open ? Colors.red : Colors.text
            font { family: "SF Mono"; pixelSize: 15; weight: 600 }
        }

        MouseArea {
            id: hover
            anchors.fill: parent
            hoverEnabled: true
            onClicked: root.open = !root.open
        }
    }

    PopupWindow {
        id: menuPopup
        color: "transparent"

        visible: root.open || clipper.height > 0

        anchor.item: root
        anchor.rect.x: 0
        anchor.rect.y: 0
        anchor.rect.width: root.width
        anchor.rect.height: root.height - 1
        anchor.edges: Edges.Bottom | Edges.Right
        anchor.gravity: Edges.Bottom | Edges.Left

        implicitWidth: 360
        implicitHeight: 200

        Item {
            id: clipper
            anchors { left: parent.left; right: parent.right; top: parent.top }
            clip: true

            height: root.open ? parent.height : 0
            Behavior on height {
                NumberAnimation { duration: 220; easing.type: Easing.OutCubic }
            }

            Rectangle {
                anchors.fill: parent
                anchors.topMargin: -20

                color: Colors.base
                border.color: Colors.surface1
                border.width: 1
                radius: 12
            }
        }
    }
}