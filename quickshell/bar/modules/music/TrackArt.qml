import Quickshell.Widgets
import Quickshell.Services.Mpris
import QtQuick
import qs.config

ClippingRectangle {
    id: root

    property MprisPlayer player: null

    implicitWidth: 72
    implicitHeight: 72
    radius: Appearance.radius.normal
    color: Colors.surface0

    // fallback
    Text {
        anchors.centerIn: parent
        visible: art.status !== Image.Ready
        text: "♪"
        color: Colors.overlay0
        font { family: Appearance.font.family; pixelSize: Appearance.font.large }
    }

    Image {
        id: art
        anchors.fill: parent
        source: root.player?.trackArtUrl ?? ""
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        cache: false
    }
}