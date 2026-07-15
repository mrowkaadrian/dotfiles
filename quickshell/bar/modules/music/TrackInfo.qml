import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts
import qs.config

ColumnLayout {
    id: root

    property MprisPlayer player: null

    spacing: 2

    Text {
        Layout.fillWidth: true
        text: root.player?.trackTitle || "Unknown Title"
        color: Colors.text
        elide: Text.ElideRight
        font { family: Appearance.font.family; pixelSize: Appearance.font.normal; weight: 600 }
    }

    Text {
        Layout.fillWidth: true
        text: root.player?.trackArtist || "Unknown Artist"
        color: Colors.subtext0
        elide: Text.ElideRight
        font { family: Appearance.font.family; pixelSize: Appearance.font.small }
    }
}