import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.components

Item {
    id: root

    implicitWidth: 28
    Layout.fillHeight: true

    property bool open: false
    onOpenChanged: if (!open) session.reset()

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

    MenuPopup {
        id: menuPopup
        anchorItem: root
        open: root.open

        implicitWidth: 360
        implicitHeight: 200

        SessionButtons {
            id: session
            anchors.fill: parent
            onCloseRequested: root.open = false
        }
    }
}