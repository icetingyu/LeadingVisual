/*
 * Copyright (c) 2014 Simon HSU fro Taiwan BlackBerry Developer Group
 * This sample shows how to make your app just like Hub
 * Can scroll down and show hiding items. about release and scroll up a little bit,
 * the shown item will be hidden.
 */

import bb.cascades 1.0

Page {
    Container {
        layout: StackLayout {}
        ListView {
            id: stampList
            objectName: "stampList"
            
            layout: GridListLayout {
                columnCount: 2
                headerMode: ListHeaderMode.Standard
                cellAspectRatio: 1.4
                spacingAfterHeader: 40
                verticalCellSpacing: 0
            }
            
            // You can put whatever you want inside the hidden area
            // The PullToRefresh also implemented by the leadingVisual component
            // This attached to the listview and can not be existed without listview.
            
            leadingVisual: [
                
                Container {
                    id: leadingVisual
                    preferredWidth: 768
                    preferredHeight: 150
                    layout: DockLayout {} 
                    Label {
                        text: "Hello, hiding";
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                    }
                }
            ]
            // This data model will be replaced by a JSON model when the application starts,
            // an XML model can be used to prototype the UI and for smaller static lists.
            dataModel: XmlDataModel {
                source: "models/stamps.xml"
            }
            
            listItemComponents: [
                ListItemComponent {
                    type: "header"
                    
                    Header {
                        title: {
                            if (ListItemData.title) {
                                // If the data is loaded from XML, a title property is used for the title.
                                ListItemData.title
                            } else {
                                // If it is loaded from JSON and set in a GroupDataModel, the header info is set in ListItemData.
                                ListItemData
                            }
                        }
                    }
                },
                // The stamp Item
                ListItemComponent {
                    type: "item"
                    StampItem {
                    }
                }
            ] // listItemComponents
            
        }
    } // End Container
    
    attachedObjects: [
        GroupDataModel {
            id: groupDataModel
        }
    ]
}
