import Quickshell
import QtQuick
import qs.config

Text {
    anchors.centerIn: parent
    text: Qt.formatDateTime(clock.date, "hh:mm")
    color: Colors.text

    font {
        family: "SF Mono"
        letterSpacing: -1
        pixelSize: 15
        weight: 600
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}