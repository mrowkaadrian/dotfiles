pragma ComponentBehavior: Bound

import QtQuick
import qs.config

Row {
    id: root

    property bool active: false
    property int barCount: 5
    property int barWidth: 2
    property int maxBarHeight: 14
    property int minBarHeight: 3
    property color barColor: Colors.mauve

    spacing: 2
    height: maxBarHeight

    Repeater {
        id: repeater
        model: root.barCount

        Rectangle {
            id: bar
            required property int index

            property real level: root.minBarHeight

            anchors.verticalCenter: parent.verticalCenter
            width: root.barWidth
            height: root.active ? level : root.minBarHeight
            radius: root.barWidth / 2
            color: root.barColor

            Behavior on height {
                NumberAnimation { duration: 140; easing.type: Easing.OutQuad }
            }
        }
    }

    Timer {
        running: root.active
        interval: 140
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            for (let i = 0; i < repeater.count; i++) {
                const item = repeater.itemAt(i);
                if (item) item.level = root.minBarHeight
                    + Math.random() * (root.maxBarHeight - root.minBarHeight);
            }
        }
    }
}