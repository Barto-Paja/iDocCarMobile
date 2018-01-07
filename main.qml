import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Dialogs.qml 1.0
import QtQuick.Layouts 1.3
import Query 0.1

Window {
    visible: true
    width: 480
    height: 640
    color: "#000000"
    title: qsTr("Hello World")

    function test(uname, passwd)
    {
        query.isOpen()
        if(query.isUser(uname,passwd))
            return true
    }

    Query{
        id: query
    }

    GridLayout {
        anchors.fill: parent
        anchors.margins: 20
        rowSpacing: 20
        columnSpacing: 20
        flow:  width > height ? GridLayout.LeftToRight : GridLayout.TopToBottom
        Rectangle {
            id: topOrLeft
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#5d5b59"
            Label {
                id: titletext
                anchors.centerIn: parent
                text: "iStatCar - drivermode"
                font.pointSize: 25
                color: "white"
            }
        }

        Rectangle {
            id: botOrRight
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#1e1b18"
            Label {
                anchors.centerIn: parent
                text: "Bottom or right"
                color: "white"
            }

            Button {
                id: button
                x: 170
                y: 182
                text: qsTr("Button")
            }

            TextField {
                id: tF_login
                x: 120
                y: 19
            }

            TextField {
                id: tF_pass
                x: 120
                y: 84
                echoMode: "Password"
            }

            Text {
                id: text1
                x: 170
                y: 65
                color: "#ffffff"
                text: qsTr("Wprowadź login i hasło")
                font.pixelSize: 12
            }
        }

    }

    Connections {
        target: button
        onClicked:
        {

            print("clicked " + tF_login.text+ " " + tF_pass.text)
            print(test(tF_login.text,tF_pass.text))

        }
    }
}
