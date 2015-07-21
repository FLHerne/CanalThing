import QtQuick 2.0

Image {
    property var currentPound: undefined
    source: "boat1.png"
    anchors.verticalCenter: currentPound.top
    x: currentPound.x + currentPound.width/2 - 50
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button === Qt.LeftButton &&
                 currentPound.leftGate &&
                 currentPound.leftGate.passable) {
                currentPound = currentPound.leftGate.leftPound;
            } else if (mouse.button === Qt.RightButton &&
                currentPound.rightGate &&
                        currentPound.rightGate.passable) {
                currentPound = currentPound.rightGate.rightPound;
            }
        }
    }
    Behavior on x {
        NumberAnimation {
            duration: 2000;
        }
    }
}
