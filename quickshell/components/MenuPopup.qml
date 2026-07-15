import Quickshell
import QtQuick
import qs.config

PopupWindow {
    id: popup

    default property alias contentData: content.data

    property Item anchorItem
    property bool open: false

    color: "transparent"
    visible: open || clipper.height > 0

    anchor.item: anchorItem
    anchor.rect.x: 0
    anchor.rect.y: 0
    anchor.rect.width: anchorItem?.width ?? 1
    anchor.rect.height: (anchorItem?.height ?? 2) - 1
    anchor.edges: Edges.Bottom | Edges.Right
    anchor.gravity: Edges.Bottom | Edges.Left

    Item {
        id: clipper
        anchors { left: parent.left; right: parent.right; top: parent.top }
        clip: true

        height: popup.open ? parent.height : 0
        Behavior on height {
            NumberAnimation { duration: 220; easing.type: Easing.OutCubic }
        }

        // Background
        Rectangle {
            anchors.fill: parent
            anchors.topMargin: -20
            color: Colors.base
            border.color: Colors.surface1
            border.width: 1
            radius: 12
        }

        Item {
            id: content
            anchors { left: parent.left; right: parent.right; top: parent.top }
            height: popup.implicitHeight
        }
    }
}