/*
 * Copyright (C) 2024  sft
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * contactsimporttrial is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Lomiri.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtContacts 5.0
import Lomiri.Content 1.1
import Qt.labs.folderlistmodel 2.8
import Qt.labs.platform 1.0

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'contactsimporttrial.sft'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)
    property var filePicker : lomiriFilePicker.createObject(root)
    readonly property Component lomiriFilePicker :  
    Qt.createComponent("LomiriFilePicker.qml", Component.PreferSynchronous)
    
    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Contacts Import Trial')
        }

        Label {
            id: label
            anchors {
             top: header.bottom
                left: parent.left
                right: parent.right
            }
            text: i18n.tr('Hello World!')

            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter
        }
        Button{
            text: "go"            
            anchors {
                top: label.bottom
                left: parent.left
                right: parent.right
            }

            onClicked:{
                console.log("go")
                filePicker.open()

            }
        }
        FolderListModel{
            id: folderlistmodel
            folder: StandardPaths.writableLocation(StandardPaths.AppDataLocation) 
        }
        Connections {

            target: ContentHub

            onImportRequested: {
                console.log("hoi")
                var filePath = String(transfer.items[0].url)
                print("Should import file", filePath)

                File.copy(".",".")
                // folderlistmodel.folder = filePath;

                 // /home/phablet/
                 // StandardPaths.writableLocation(StandardPaths.AppDataLocation) 
                
            }
        } 
        
    }
}
