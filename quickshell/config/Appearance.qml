pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property int barHeight: 30

    readonly property QtObject font: QtObject {
        readonly property string family: "SF Mono"
        readonly property int small: 11
        readonly property int normal: 15
        readonly property int large: 22
    }

    readonly property QtObject radius: QtObject {
        readonly property int small: 6
        readonly property int normal: 10
        readonly property int large: 12
    }

    readonly property QtObject anim: QtObject {
        readonly property int fast: 130
        readonly property int normal: 150
        readonly property int slow: 220
    }
}