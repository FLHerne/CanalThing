import QtQuick 2.0

Item {
    id: flightRoot
    width: childrenRect.width

    Pound {
        magic: true
        baseHeight: 50
        maxDepth: 10
        width: 200
    }
    Pound {
        baseHeight: 40
        maxDepth: 20
    }
    Pound {
        baseHeight: 30
        maxDepth: 20
    }
    Pound {
        baseHeight: 30
        maxDepth: 10
    }
    Pound {
        baseHeight: 20
        maxDepth: 20
    }
    Pound {
        magic: true
        baseHeight: 20
        maxDepth: 10
    }
    Pound {
        baseHeight: 20
        maxDepth: 20
    }
    Pound {
        baseHeight: 30
        maxDepth: 20
    }
    Pound {
        baseHeight: 40
        maxDepth: 10
        magic: true
        width: 200
    }

    Component.onCompleted: {
        var gateComponent = Qt.createComponent("Gate.qml");
        var frChildren = flightRoot.children
        var lenm1 = frChildren.length - 1;
        for (var ic = 0; ic < lenm1; ++ic) {
            gateComponent.createObject(this, {
                "leftPound": frChildren[ic],
                "rightPound": frChildren[ic+1]
            });
            frChildren[ic+1].anchors.left = frChildren[ic].right
        }
        var boatComponent = Qt.createComponent("Boat.qml");
        boatComponent.createObject(this, {currentPound: frChildren[1]})
    }
}
