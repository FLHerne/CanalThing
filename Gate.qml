import QtQuick 2.0

Item {
    id: gateRoot
    property var leftPound: undefined
    property var rightPound: undefined
    property bool open: false

    Timer {
        interval: 10; running: true; repeat: true
        onTriggered: {
            if (!open || rightPound.full) return;
            var heightDiff = leftPound.waterHeight - rightPound.waterHeight;
            var heightSign = heightDiff ? heightDiff < 0 ? -1 : 1 : 0; //AAA
            leftPound.waterVolume -= 10 * heightSign //TODO: non-constant flowrate
            rightPound.waterVolume += 10 * heightSign
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
        color: open ? rightPound.full ? "red" : "lightgray" : "black"
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