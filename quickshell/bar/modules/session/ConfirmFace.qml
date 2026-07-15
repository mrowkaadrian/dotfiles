import QtQuick
import QtQuick.Layouts
import qs.config
import qs.components

RowLayout {
    id: root
    spacing: 6

    signal confirmed()
    signal cancelled()

    IconButton {
        Layout.fillWidth: true
        Layout.fillHeight: true
        glyph: "✓"
        accent: Colors.green
        onClicked: root.confirmed()
    }

    IconButton {
        Layout.fillWidth: true
        Layout.fillHeight: true
        glyph: "✕"
        accent: Colors.red
        onClicked: root.cancelled()
    }
}