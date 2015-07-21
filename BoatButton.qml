import QtQuick 2.0

Image {
    source: "boat1.png"
    anchors.bottom: parent.bottom
    height: labelsButton.height
    width: height * (sourceSize.width/sourceSize.height)
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
    Rectangle {
        anchors.fill: parent
        color: "white";
        radius: 2
        z: -1
    }
}