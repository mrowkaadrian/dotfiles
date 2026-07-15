import QtQuick
import qs.config

Rectangle {
    id: root

    required default property Item content

    property int hPadding: Appearance.padding.large
    property int fixedWidth: 0        // 0 = size to content
    property bool highlighted: false

    children: [content]

    implicitWidth: fixedWidth > 0 ? fixedWidth : content.implicitWidth + hPadding * 2
    implicitHeight: Appearance.bar.pillHeight

    radius: height / 2
    color: highlighted ? Colors.surface0 : Colors.base
    border.color: Colors.surface1
    border.width: 1
    Behavior on color { ColorAnimation { duration: Appearance.anim.normal } }

    Binding { root.content.x: (root.width - root.content.implicitWidth) / 2 }
    Binding { root.content.y: (root.height - root.content.implicitHeight) / 2 }
    Binding { root.content.width: root.content.implicitWidth }
    Binding { root.content.height: root.content.implicitHeight }
}