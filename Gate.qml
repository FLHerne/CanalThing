import QtQuick 2.0

Rectangle {
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

    MouseArea {
        anchors.fill: parent
        onClicked: {
            open = !(open);
        }
    }

    color: open ? "lightgray" : overflowing ? "red" : "black"
    z: 1; width: 5; radius: 2.5
    height: 3 * Math.max(leftPound.maxHeight, rightPound.maxHeight) + 3 - anchors.bottomMargin

    anchors.horizontalCenter: leftPound.right
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 3 * Math.max(leftPound.baseHeight, rightPound.baseHeight)
}
