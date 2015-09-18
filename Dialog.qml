import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {

    anchors.fill: parent
    color: "transparent"
    visible: false
    opacity: 0

    signal hidded

    Behavior on opacity {
        PropertyAnimation {
            duration: 200
        }
    }

    Rectangle {
        color: "black"
        opacity: 0.7
        anchors.fill: parent

        MouseArea {
            anchors.fill: parent
            onClicked: hide();
        }
    }
    Rectangle {

        anchors.centerIn: parent
        width: parent.width*(0.7)
        height: parent.height*(0.5)

        Text {
            id:titleLabel
            text:"Title:"

            color:"#444"

            font {
                bold: true
                pixelSize: parent.height/10
            }

            anchors.left: parent.left
            anchors.leftMargin: parent.width*(0.05)
            anchors.top: parent.top
            anchors.topMargin: parent.height*(0.01)
        }

        TextField {
            id:titleTextField

            font {
                pixelSize: parent.height/15
            }

            anchors.left: parent.left
            anchors.leftMargin: parent.width*(0.05)
            anchors.right: parent.right
            anchors.rightMargin: parent.width*(0.05)
            anchors.top: titleLabel.bottom
            anchors.topMargin: parent.height*(0.01)

        }

        Text {
            id:descriptionLabel
            text:"Description:"

            color:"#444"

            font {
                bold: true
                pixelSize: parent.height/10
            }

            anchors.left: parent.left
            anchors.leftMargin: parent.width*(0.05)
            anchors.top: titleTextField.bottom
            anchors.topMargin: parent.height*(0.01)
        }

        TextArea{

            id: descriptionTextArea

            font {
                pixelSize: parent.height/15
            }

            wrapMode: Text.WrapAtWordBoundaryOrAnywhere

            anchors.left: parent.left
            anchors.leftMargin: parent.width*(0.05)
            anchors.right: parent.right
            anchors.rightMargin: parent.width*(0.05)
            anchors.top: descriptionLabel.bottom
            anchors.topMargin: parent.height*(0.01)
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height*(0.2)
        }

        Rectangle {

            anchors {
                right:descriptionTextArea.right

                left: parent.left
                leftMargin: parent.width*(0.7)

                top:descriptionTextArea.bottom
                topMargin: parent.height*(0.03)

                bottom: parent.bottom
                bottomMargin: parent.height*(0.03)
            }

            color:"#607D8B"

            Text {
                id: btnLabel
                text: "Register"

                anchors.centerIn: parent
                color:"white"

                font {
                    bold:true
                    pixelSize: parent.height/2
                }
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    if(titleTextField.text.length == 0)
                        titleLabel.color = "red";
                    if(descriptionTextArea.text.length == 0)
                        descriptionLabel.color = "red"
                    if(titleTextField.text.length > 0 && descriptionTextArea.text.length > 0) {
                        addCard(titleTextField.text, descriptionTextArea.text);
                        hide();
                    }
                }
            }
        }
    }

    //JS Functions

    function show() {
        visible = true
        opacity = 1
    }

    function hide() {
        opacity = 0
        visible = false

        clear();

        hidded();
    }

    function clear() {
        titleLabel.color = "#444"
        descriptionLabel.color = "#444"

        titleTextField.text = ""
        descriptionTextArea.text = ""
    }
}

