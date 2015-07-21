import QtQuick 2.0

Image {
    source: "boat1.png"
    anchors.bottom: parent.bottom
    property var boatComponent: Qt.createComponent("Boat.qml")
    MouseArea {
        anchors.fill: parent
        onClicked: {
            boatComponent.createObject(
                flight, {
                "currentPound": mirror ? flight.pounds[0] :
                                         flight.pounds[flight.pounds.length-1],
                "mirror": mirror
            })
        }
    }
}