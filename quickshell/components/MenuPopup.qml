import Quickshell
import QtQuick
import qs.config

PopupWindow {
    id: popup

    default property alias contentData: content.data

    property Item anchorItem
    property bool open: false
    property int gap: Appearance.bar.gap
    property int edges: Edges.Bottom | Edges.Right
    property int gravity: Edges.Bottom | Edges.Left
    property int xOffset: 0
    property int yOffset: 0

    color: "transparent"
    visible: open || clipper.height > 0

    anchor.item: anchorItem
    anchor.rect.x: xOffset
    anchor.rect.y: yOffset
    anchor.rect.width: anchorItem?.width ?? 1
    anchor.rect.height: (anchorItem?.height ?? 1) + gap
    anchor.edges: edges
    anchor.gravity: gravity

    Item {
        id: clipper

        anchors { left: parent.left; right: parent.right; top: parent.top }
        clip: true

        height: popup.open ? parent.height : 0
        Behavior on height {
            NumberAnimation { duration: Appearance.anim.slow; easing.type: Easing.OutCubic }
        }

        Rectangle {
            anchors.fill: parent
            color: Colors.base
            border.color: Colors.surface1
            border.width: 1
            radius: Appearance.radius.large
        }

        Item {
            id: content
            anchors { left: parent.left; right: parent.right; top: parent.top }
            height: popup.implicitHeight
        }
    }
}