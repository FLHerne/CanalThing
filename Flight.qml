import QtQuick 2.0

Rectangle {
    Pound {
        id: pound1
        magic: true
        baseHeight: 50
        maxDepth: 10
        width: 200
    }
    Gate {
        leftPound: pound1
        rightPound: pound2
    }
    Pound {
        id: pound2
        baseHeight: 40
        maxDepth: 20
        anchors.left: pound1.right
    }
    Gate {
        leftPound: pound2
        rightPound: pound3
    }
    Pound {
        id: pound3
        baseHeight: 30
        maxDepth: 20
        anchors.left: pound2.right
    }
    Gate {
        leftPound: pound3
        rightPound: pound4
    }
    Pound {
        id: pound4
        anchors.left: pound3.right
        baseHeight: 30
        maxDepth: 10
    }
    Gate {
        leftPound: pound4
        rightPound: pound5
    }
    Pound {
        id: pound5
        anchors.left: pound4.right
        baseHeight: 20
        maxDepth: 20
    }
    Gate {
        leftPound: pound5
        rightPound: pound6
    }
    Pound {
        id: pound6
        magic: true
        baseHeight: 20
        maxDepth: 10
        anchors.left: pound5.right
    }
    Gate {
        leftPound: pound6
        rightPound: pound7
    }
    Pound {
        id: pound7
        baseHeight: 20
        maxDepth: 20
        anchors.left: pound6.right
    }
    Gate {
        leftPound: pound7
        rightPound: pound8
    }
    Pound {
        id: pound8
        baseHeight: 30
        maxDepth: 20
        anchors.left: pound7.right
    }
    Gate {
        leftPound: pound8
        rightPound: pound9
    }
    Pound {
        id: pound9
        anchors.left: pound8.right
        baseHeight: 40
        maxDepth: 10
        magic: true
        width: 200
    }
}
