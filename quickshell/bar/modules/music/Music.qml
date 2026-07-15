import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import qs.config
import qs.components

Item {
    id: root

    property bool open: false

    readonly property MprisPlayer player: {
        const players = Mpris.players.values;
        return players.find(p => p.isPlaying)
            ?? players.find(p => p.playbackState === MprisPlaybackState.Paused)
            ?? null;
    }

    visible: !!player
    implicitWidth: visible ? pill.implicitWidth : 0
    implicitHeight: pill.implicitHeight

    onVisibleChanged: if (!visible) open = false

    Pill {
        id: pill
        hPadding: Appearance.padding.normal
        highlighted: root.open || mouse.containsMouse

        Row {
            spacing: 8

            Visualizer {
                anchors.verticalCenter: parent.verticalCenter
                active: root.player?.isPlaying ?? false
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: root.player?.trackTitle ?? ""
                color: Colors.text
                elide: Text.ElideRight
                width: Math.min(implicitWidth, 180)
                font { family: Appearance.font.family; pixelSize: Appearance.font.small; weight: 500 }
            }
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.open = !root.open
    }

    MenuPopup {
        anchorItem: root
        open: root.open

        edges: Edges.Bottom | Edges.Left
        gravity: Edges.Bottom | Edges.Right

        implicitWidth: 320
        implicitHeight: 100

        MusicControls {
            anchors.fill: parent
            player: root.player
        }
    }
}