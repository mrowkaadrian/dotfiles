import Quickshell
import QtQuick
import qs.config
import qs.components
import qs.services

Item {
    id: root

    readonly property bool open: PopupManager.current === root
    onOpenChanged: if (!open) session.reset()

    implicitWidth: pill.implicitWidth
    implicitHeight: pill.implicitHeight

    Pill {
        id: pill
        fixedWidth: 100
        highlighted: root.open || mouse.containsMouse

        Text {
            text: "⏻"
            color: root.open ? Colors.red : Colors.text
            font { family: Appearance.font.family; pixelSize: Appearance.font.normal; weight: 600 }
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: PopupManager.toggle(root)
    }

    MenuPopup {
        anchorItem: root
        open: root.open

        implicitWidth: 360
        implicitHeight: 200

        SessionButtons {
            id: session
            anchors.fill: parent
            onCloseRequested: PopupManager.close(root)
        }
    }
}