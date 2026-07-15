import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.components

RowLayout {
    id: root

    property MprisPlayer player: null

    spacing: 4

    IconButton {
        implicitWidth: 28
        implicitHeight: 28
        radius: width / 2
        glyph: "⏮"
        enabled: root.player?.canGoPrevious ?? false
        opacity: enabled ? 1 : 0.35
        onClicked: root.player?.previous()
    }

    IconButton {
        implicitWidth: 32
        implicitHeight: 32
        radius: width / 2
        glyph: (root.player?.isPlaying ?? false) ? "⏸" : "▶"
        accent: Colors.mauve
        enabled: root.player?.canTogglePlaying ?? false
        opacity: enabled ? 1 : 0.35
        onClicked: root.player?.togglePlaying()
    }

    IconButton {
        implicitWidth: 28
        implicitHeight: 28
        radius: width / 2
        glyph: "⏭"
        enabled: root.player?.canGoNext ?? false
        opacity: enabled ? 1 : 0.35
        onClicked: root.player?.next()
    }
}