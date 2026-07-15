import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    property MprisPlayer player: null

    RowLayout {
        anchors.fill: parent
        anchors.margins: 14
        spacing: 12

        TrackArt {
            player: root.player
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 2

            TrackInfo {
                Layout.fillWidth: true
                player: root.player
            }

            Item { Layout.fillHeight: true }

            RowLayout {
                Layout.fillWidth: true
                spacing: 8

                TrackControls {
                    player: root.player
                }

                VolumeControl {
                    Layout.fillWidth: true
                    player: root.player
                }
            }
        }
    }
}