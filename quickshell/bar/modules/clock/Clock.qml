import Quickshell
import QtQuick
import qs.config
import qs.components

Pill {
    id: pill
    fixedWidth: 100
    highlighted: root.open || mouse.containsMouse

    Text {
        text: Qt.formatDateTime(clock.date, "hh:mm")
        color: Colors.text

        font {
            family: Appearance.font.family
            letterSpacing: -1
            pixelSize: Appearance.font.normal
            weight: 600
        }

        SystemClock {
            id: clock
            precision: SystemClock.Minutes
        }
    }
}