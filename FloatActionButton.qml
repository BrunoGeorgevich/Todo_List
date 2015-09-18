import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {

    property string mainRectColor
    property real iconScale : 3.5
    property string icon: ""
    property real raio : 50

    radius: raio
    width: raio
    height: raio

    Connections {
        target:createTaskDialog
        onHidded:{
            mainRect.color = mainRectColor;
            fabIcon.rotation = 0;
        }
    }

    DropShadow {
        anchors.fill: mainRect
        source:mainRect
        horizontalOffset: 0
        verticalOffset: 7
        radius: 8.0
        samples: 24
        color: "#90000000"
        transparentBorder: true
    }

    Rectangle {
        id:mainRect

        radius: raio
        width: raio
        height: raio

        color: mainRectColor
        anchors.fill: parent

        Image {
            id:fabIcon
            anchors{
                fill: parent
                topMargin: parent.height/iconScale
                leftMargin: parent.height/iconScale
                rightMargin: parent.height/iconScale
                bottomMargin: parent.height/iconScale
            }
            source: icon

            Behavior on rotation {
                NumberAnimation {
                    duration: 150
                }
            }
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                mainRect.color = Qt.darker(mainRectColor,1.2);
                fabIcon.rotation = 90

                createTaskDialog.show();
            }
        }
    }

}

