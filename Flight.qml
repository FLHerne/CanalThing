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
        Boat { mirror: true }
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
        Boat {}
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
        var lenm1 = flightRoot.children.length - 1;
        for (var ic = 0; ic < lenm1; ++ic) {
            gateComponent.createObject(this, {
                "leftPound": flightRoot.children[ic],
                "rightPound": flightRoot.children[ic+1]
            });
            flightRoot.children[ic+1].anchors.left = flightRoot.children[ic].right
        }
    }
}
