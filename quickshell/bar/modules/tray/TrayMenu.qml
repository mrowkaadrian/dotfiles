pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config

ColumnLayout {
    id: root

    property var handle: null
    readonly property alias entries: opener.children

    signal closeRequested()

    spacing: 2

    QsMenuOpener {
        id: opener
        menu: root.handle
    }

    Repeater {
        model: opener.children

        Item {
            id: entry
            required property QsMenuEntry modelData

            Layout.fillWidth: true
            implicitHeight: modelData.isSeparator ? 7 : 26

            Rectangle {
                visible: entry.modelData.isSeparator
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width
                height: 1
                color: Colors.surface1
            }

            Rectangle {
                visible: !entry.modelData.isSeparator
                anchors.fill: parent
                radius: Appearance.radius.small
                color: (entryMouse.containsMouse && entry.modelData.enabled)
                    ? Colors.surface0 : "transparent"
                Behavior on color { ColorAnimation { duration: Appearance.anim.fast } }

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 8
                    anchors.rightMargin: 8
                    spacing: 8

                    Image {
                        visible: entry.modelData.icon !== ""
                        source: entry.modelData.icon
                        Layout.preferredWidth: 14
                        Layout.preferredHeight: 14
                        sourceSize.width: 14
                        sourceSize.height: 14
                    }

                    Text {
                        Layout.fillWidth: true
                        text: entry.modelData.text
                        color: entry.modelData.enabled ? Colors.text : Colors.overlay0
                        elide: Text.ElideRight
                        font { family: Appearance.font.family; pixelSize: Appearance.font.small }
                    }

                    Text {
                        visible: entry.modelData.hasChildren
                        text: "›"
                        color: Colors.overlay1
                        font { family: Appearance.font.family; pixelSize: Appearance.font.small }
                    }
                }

                MouseArea {
                    id: entryMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    enabled: entry.modelData.enabled && !entry.modelData.hasChildren
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        entry.modelData.triggered();
                        root.closeRequested();
                    }
                }
            }
        }
    }
}