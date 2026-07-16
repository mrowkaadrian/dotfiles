import Quickshell
import QtQuick
import qs.config
import qs.services
import qs.components

Item {
    id: root

    readonly property bool open: PopupManager.current === root

    implicitWidth: pill.implicitWidth
    implicitHeight: pill.implicitHeight

    Pill {
        id: pill
        highlighted: root.open || mouse.containsMouse

        Text {
            text: Qt.formatDateTime(clock.date, "hh:mm")
            color: Colors.text

            font {
                family: Appearance.font.family
                letterSpacing: -1
                pixelSize: Appearance.font.normal
                weight: 600
            }

            SystemClock {
                id: clock
                precision: SystemClock.Minutes
            }
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
        id: popup
        anchorItem: root
        open: root.open

        edges: Edges.Bottom | Edges.Left
        gravity: Edges.Bottom | Edges.Right
        xOffset: (root.width - popup.implicitWidth) / 2

        implicitWidth: 600
        implicitHeight: 400

        CalendarPopup {
            anchors.fill: parent
        }
    }
}