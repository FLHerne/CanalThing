import QtQuick 2.0

Image {
    id: boatRoot
    property var currentPound: undefined
    source: "boat1.png"

    x: currentPound.x + currentPound.width/2 - width/2
    anchors.verticalCenter: currentPound.top

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button === Qt.LeftButton) {
                if (!currentPound.leftGate) {
                    boatRoot.x = -width;
                    boatRoot.destroy(2000);
                } else if (currentPound.leftGate.passable) {
                    currentPound = currentPound.leftGate.leftPound;
                }
            } else if (mouse.button === Qt.RightButton) {
                if (!currentPound.rightGate) {
                    boatRoot.x = mainWindow.width;
                    boatRoot.destroy(2000);
                } else if (currentPound.rightGate.passable) {
                    currentPound = currentPound.rightGate.rightPound;
                }
            }
        }
    }

    Behavior on x {
        NumberAnimation {
            duration: 4500;
        }
    }
}
