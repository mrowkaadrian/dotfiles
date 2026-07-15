import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.components

RowLayout {
    id: root

    property MprisPlayer player: null

    property real volume: 1
    property real preMuteVolume: 1
    property bool muted: false

    // volume control won't work on some players
    readonly property bool controllable:
        (player?.volumeSupported ?? false) && (player?.canControl ?? false)

    visible: controllable
    spacing: 4

    // MPRIS has no mute - fake it by remembering last level.
    function sync() {
        volume = player?.volume ?? 1;
        muted = volume === 0;
        if (volume > 0) preMuteVolume = volume;
    }

    onPlayerChanged: sync()

    function apply(v) {
        volume = v;
        muted = v === 0;
        if (player) player.volume = v;
    }

    IconButton {
        implicitWidth: 22
        implicitHeight: 22
        radius: width / 2
        glyph: (root.player?.volume ?? 0) > 0 ? "🔊" : "🔇"
        accent: Colors.subtext0
        glyphSize: Appearance.font.small

        onClicked: {
            if (root.muted) {
                root.apply(root.preMuteVolume);
            } else {
                root.preMuteVolume = root.volume;
                root.apply(0);
            }
        }
    }

    Slider {
        Layout.fillWidth: true
        value: root.volume
        onMoved: v => {
            if (v > 0) root.preMuteVolume = v;
            root.apply(v);
        }
    }
}