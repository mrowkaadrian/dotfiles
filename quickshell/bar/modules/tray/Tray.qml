import Quickshell
import Quickshell.Services.SystemTray
import QtQuick
import qs.config
import qs.components

Item {
    id: root

    visible: SystemTray.items.values.length > 0
    implicitWidth: visible ? pill.implicitWidth : 0
    implicitHeight: pill.implicitHeight

    Pill {
        id: pill
        hPadding: Appearance.padding.normal

        Row {
            spacing: 10

            Repeater {
                model: SystemTray.items

                TrayItem {
                    required property SystemTrayItem modelData
                    item: modelData
                }
            }
        }
    }
}