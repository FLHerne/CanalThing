import QtQuick 2.0

Item {
    id: poundRoot
    property bool magic: false
    property double baseHeight: 0
    property double maxDepth: 0
    property double waterVolume: width * maxDepth //Initial setting only
    property bool full: waterVolume >= width * maxDepth
    property double waterDepth: waterVolume / width
    property double waterHeight: baseHeight + waterDepth

    onWaterVolumeChanged: {
        if (magic) {
            waterVolume = width * maxDepth - 1;
        }
    }

    width: 200
    anchors.bottom: parent.bottom
    Rectangle {
        id: ground
        color: "brown"
        height: 3 * baseHeight
        anchors.left: poundRoot.left
        anchors.right: poundRoot.right
        anchors.bottom: poundRoot.bottom
    }
    Rectangle {
        id: poundSide
        color: "gray"
        height: 3 * maxDepth
        anchors.left: poundRoot.left
        anchors.right: poundRoot.right
        anchors.bottom: ground.top
    }
    Rectangle {
        id: water
        color: "blue"
        height: 3 * waterDepth
        anchors.left: poundRoot.left
        anchors.right: poundRoot.right
        anchors.bottom: ground.top
    }
}
