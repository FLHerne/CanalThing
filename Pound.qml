import QtQuick 2.0

Rectangle {
    id: poundRoot
    property var leftGate
    property var rightGate

    property bool magic: false
    property double baseHeight: 0
    property double maxDepth: 0
    property double maxHeight: baseHeight + maxDepth
    property double maxVolume: width * maxDepth
    property double waterVolume: maxVolume //Initial setting only
    property double excessVolume: Math.max(0, waterVolume - maxVolume)
    property double waterDepth: waterVolume / width
    property double waterHeight: baseHeight + waterDepth

    onWaterVolumeChanged: {
        if (magic) {
            waterVolume = maxVolume;
        }
    }

    width: 100
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
        z: -1
        anchors.left: poundRoot.left
        anchors.right: poundRoot.right
        anchors.bottom: ground.top
    }
    Text {
        visible: showLabels.checked
        text: Math.abs(waterVolume).toFixed() + "/" + maxVolume.toFixed()
        anchors.bottom: poundSide.top
        anchors.bottomMargin: 14
        anchors.horizontalCenter: poundSide.horizontalCenter
    }
    color: "blue"
    height: 3 * waterHeight
    property bool isPound: true //This is stupid
}
