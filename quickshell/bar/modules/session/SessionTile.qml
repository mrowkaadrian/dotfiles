import QtQuick
import qs.config
import qs.config

Rectangle {
    id: tile

    property string glyph
    property string label
    property color accent
    property bool confirming: false

    signal armRequested()
    signal confirmed()
    signal cancelled()

    implicitWidth: 80
    implicitHeight: 86
    radius: Appearance.radius.normal

    color: (face.hovered && !confirming) ? Colors.surface1 : Colors.surface0
    Behavior on color { ColorAnimation { duration: Appearance.anim.normal } }

    TileFace {
        id: face
        anchors.fill: parent

        glyph: tile.glyph
        label: tile.label
        accent: tile.accent

        opacity: tile.confirming ? 0 : 1
        visible: opacity > 0
        enabled: !tile.confirming
        Behavior on opacity { NumberAnimation { duration: Appearance.anim.fast } }

        onClicked: tile.armRequested()
    }

    ConfirmFace {
        anchors.fill: parent
        anchors.margins: 6

        opacity: tile.confirming ? 1 : 0
        visible: opacity > 0
        enabled: tile.confirming
        Behavior on opacity { NumberAnimation { duration: Appearance.anim.fast } }

        onConfirmed: tile.confirmed()
        onCancelled: tile.cancelled()
    }
}