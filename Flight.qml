import QtQuick 2.0

Rectangle {
    Pound {
        id: pound1
        magic: true
        baseHeight: 50
        maxDepth: 10
        width: 300
    }
    Gate {
        id: gate1
        leftPound: pound1
        rightPound: pound2
    }
    Pound {
        id: pound2
        baseHeight: 40
        maxDepth: 20
        anchors.left: gate1.right
    }
    Gate {
        id: gate2
        leftPound: pound2
        rightPound: pound3
    }
    Pound {
        id: pound3
        baseHeight: 40
        maxDepth: 10
        waterVolume: 600
        anchors.left: gate2.right
    }
    Gate {
        id: gate3
        leftPound: pound3
        rightPound: pound4
    }
    Pound {
        id: pound4
        anchors.left: gate3.right
        baseHeight: 30
        maxDepth: 20
        waterVolume: 2600
    }
    Gate {
        id: gate4
        leftPound: pound4
        rightPound: pound5
    }
    Pound {
        id: pound5
        magic: true
        baseHeight: 30
        maxDepth: 10
        anchors.left: gate4.right
    }
}
