import QtQuick 2.0

Item {
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

    width: 200
    anchors.bottom: parent.bottom
    Image {
        id: waterTop
        source: "watertop.png"
        fillMode: Image.TileHorizontally
        verticalAlignment: Image.AlignTop
        horizontalAlignment: Image.AlignLeft
        anchors.top: parent.top
        anchors.topMargin: -2 //For wibbly surface
        anchors.left: parent.left
        anchors.right: parent.right
    }
    Rectangle {
        id: water
        color: "#E1000000"
        anchors.top: waterTop.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
    Rectangle {
        id: ground
        color: "black"
        height: 3 * baseHeight
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
    Image {
        id: groundTop
        source: "mudtop.png"
        fillMode: Image.TileHorizontally
        anchors.top: ground.top
        anchors.topMargin: -3 //For wibbly surface
        anchors.left: parent.left
        anchors.right: parent.right
    }
    Image {
        id: poundSideTop
        source: "bricktop.png"
        fillMode: Image.TileHorizontally
        verticalAlignment: Image.AlignTop
        horizontalAlignment: Image.AlignLeft
        z: -1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: ground.top
        anchors.topMargin: -(3 * maxDepth + 10) //Water not right to top
    }
    Image {
        id: poundSide
        source: "brick.png"
        fillMode: Image.Tile
        verticalAlignment: Image.AlignTop
        horizontalAlignment: Image.AlignLeft
        z: -1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: poundSideTop.bottom
        anchors.bottom: parent.bottom
    }
    Text {
        visible: labelsButton.checked
        text: Math.abs(waterVolume).toFixed() + "/" + maxVolume.toFixed()
        anchors.bottom: poundSideTop.top
        anchors.bottomMargin: 14
        anchors.horizontalCenter: parent.horizontalCenter
    }
    height: 3 * waterHeight
    property bool isPound: true //This is stupid
}
