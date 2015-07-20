import QtQuick 2.0

Item {
    id: gateRoot
    property var leftPound: undefined
    property var rightPound: undefined
    property bool open: false
    property bool overflowing: false

    Timer {
        interval: 10; running: true; repeat: true
        onTriggered: {
            var heightDiff = leftPound.waterHeight - rightPound.waterHeight;
            var heightSign = heightDiff ? heightDiff < 0 ? -1 : 1 : 0;
            var flowRate = 1.5 * Math.sqrt(Math.abs(heightDiff))
            if (!open) flowRate = 0.;
            var higherPound = (heightSign == 1) ? leftPound : rightPound
            flowRate += higherPound.excessVolume
            parent.overflowing = higherPound.excessVolume > 0.1 //Arbitrary
            leftPound.waterVolume -= flowRate * heightSign
            rightPound.waterVolume += flowRate * heightSign
        }
    }

    Rectangle {
        id: ground
        color: "brown"
        height: 3 * parent.leftPound.baseHeight
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
    Rectangle {
        id: gate
        color: open ? "lightgray" : overflowing ? "red" : "black"
        height: 3 * parent.leftPound.maxDepth + 3
        anchors.left:parent.left
        anchors.right: parent.right
        anchors.bottom: ground.top
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gateRoot.open = !(gateRoot.open);
            }
        }
    }

    width: 4
    anchors.left: leftPound.right
    anchors.bottom: parent.bottom
}