import QtQuick
import QtQuick.Layouts
import qs.config
import qs.components

RowLayout {
    id: root

    property date viewDate: new Date()

    signal prev()
    signal next()

    spacing: 8

    IconButton {
        implicitWidth: 24
        implicitHeight: 24
        radius: width / 2
        glyph: "‹"
        onClicked: root.prev()
    }

    Text {
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        text: root.viewDate.toLocaleDateString(Appearance.locale, "MMMM yyyy")
        color: Colors.text
        font { family: Appearance.font.family; pixelSize: Appearance.font.normal; weight: 600 }
    }

    IconButton {
        implicitWidth: 24
        implicitHeight: 24
        radius: width / 2
        glyph: "›"
        onClicked: root.next()
    }
}