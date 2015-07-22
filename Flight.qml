import QtQuick 2.0

Item {
    //vvv Pound definitions vvv
    Pound {
        magic: true
        baseHeight: 40
        maxDepth: 8
        width: 300
    }
    Pound {
        baseHeight: 32
        maxDepth: 16
    }
    Pound {
        baseHeight: 24
        maxDepth: 16
    }
    Pound {
        baseHeight: 24
        maxDepth: 8
    }
    Pound {
        baseHeight: 16
        maxDepth: 16
    }
    Pound {
        magic: true
        baseHeight: 16
        maxDepth: 8
    }
    Pound {
        baseHeight: 16
        maxDepth: 16
    }
    Pound {
        baseHeight: 24
        maxDepth: 16
    }
    Pound {
        baseHeight: 32
        maxDepth: 8
        magic: true
        width: 200
    }
    //^^^ Pound definitions ^^^

    id: flightRoot
    width: childrenRect.width
    property var pounds: [] //Filled later

    Component.onCompleted: {
        var gateComponent = Qt.createComponent("Gate.qml");
        for (var ic = 0; ic < flightRoot.children.length; ++ic) {
            if (flightRoot.children[ic].isPound) {
                pounds.push(flightRoot.children[ic])
            }
        }
        var nps1 = pounds.length - 1;
        for (var ic = 0; ic < nps1; ++ic) {
            gateComponent.createObject(this, {
                "leftPound": pounds[ic],
                "rightPound": pounds[ic+1]
            });
            pounds[ic+1].anchors.left = pounds[ic].right
        }
    }
}
