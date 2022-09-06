import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Server ChatApp")

    Connections{
        target: server
        function onNewMessage(mesage){
            listModelMessages.append({
                                 message:ba+""
                                     })
        }
    }

    ColumnLayout{
        anchors.fill: parent
        ListView{  //to show our messages in
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: ListModel{
                id:listModelMessages
                ListElement{
                    message:"welcome to server"
                }
            }
            delegate: ItemDelegate{
                text:message
            }
            ScrollBar.vertical: ScrollBar{}
        }

        RowLayout{
            TextField{
                id:txtfield
                placeholderText: qsTr("your message")
                Layout.fillWidth: true
                onAccepted: buttonSend.clicked()

            }
            Button{
                id: buttonSend
                text: qsTr("send")
                onClicked:
                    server.sendMessage(textFieldMessage.text)

            }
        }
    }
}
