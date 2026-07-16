import QtQuick
import QtQuick.Layouts
import qs.config

Item {
    id: root

    property date viewDate: new Date()
    property date selectedDate: new Date()

    function shiftMonth(delta) {
        const d = new Date(root.viewDate);
        d.setDate(1);
        d.setMonth(d.getMonth() + delta);
        root.viewDate = d;
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 14
        spacing: 12

        CalendarHeader {
            Layout.fillWidth: true
            viewDate: root.viewDate
            onPrev: root.shiftMonth(-1)
            onNext: root.shiftMonth(1)
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 14

            DaySchedule {
                Layout.preferredWidth: 200
                Layout.fillHeight: true
                day: root.selectedDate
            }

            // spacer
            Rectangle { 
                Layout.preferredWidth: 1
                Layout.fillHeight: true
                color: Colors.surface1
            }

            CalendarGrid {
                Layout.preferredWidth: 300      // == available height → square
                Layout.fillHeight: true
                viewDate: root.viewDate
                selectedDate: root.selectedDate
                onDayClicked: day => root.selectedDate = day
            }
        }
    }
}