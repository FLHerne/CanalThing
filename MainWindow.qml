import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0

Window {
    title: "CanalThing"
    width: 800
    height: 600
    minimumWidth: 200
    minimumHeight: 200
    ScrollView {
        id: scrollView
        anchors.fill: parent
        ColumnLayout {
            height: Math.max(scrollView.viewport.height,
                             flight.childrenRect.height + 40)
            Item { Layout.fillHeight: true } // Spacer
            Flight {
                id: flight
            }
        }
    }
}