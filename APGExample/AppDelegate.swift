//
//  AppDelegate.swift
//  APGExample
//
//  Created by Steve Sheets on 8/20/25.
//

import Cocoa
import APGIntentKit

var gMyFlag = false

@MainActor
@main
class AppDelegate: NSObject, NSApplicationDelegate {

    override init() {
        super.init()

        // Setup the Intent Information
        
        APGIntentInfoList.shared.add(contentsOf: [
            APGIntentInfo(token: "myAbout",   name: "About Example",   symbolName: "info.circle"),
            APGIntentInfo(token: "myWelcome", name: "Welcome", symbolName: "sun.max"),
            APGIntentInfo(token: "myHelp",    name: "Additional Help",    symbolName: "hand.wave"),
            APGIntentInfo(token: "myDetails", name: "Details", symbolName: "macwindow"),
            
            APGIntentInfo(token: "myFlag",    name: "Flag",    alwaysOn: false, symbolName: "flag")
        ])
    }


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Setup the Intent Actions
        
        APGIntentActionList.sharedApp.addAction(token: "myAbout") { _ in
            self.myAlert("This is specialized about window for the App")
        }
        APGIntentActionList.sharedApp.addAction(token: "myWelcome") { _ in
            self.myAlert("This is specialized welcome window for the app")
        }
        APGIntentActionList.sharedApp.addAction(token: "myHelp") { _ in
            self.myAlert("This is additional help window for the app")
        }

        APGIntentActionList.sharedApp.addAction(token: "flag",
                                                action: { _ in gMyFlag = !gMyFlag },
                                                appearance: { _ in return (true, gMyFlag, nil) })

        // Place Intent in Menus
        
        APGIntentMacTools.addAppMenuIntents(about: ["myAbout", "myWelcome"],
                                              settings: [ "myDetails"])
        
        APGIntentMacTools.addMenuBeforeHelp(named: "Tools", tokens: ["myFlag"])

        APGIntentMacTools.addHelpMenuIntents(help: ["myHelp"])
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

    func myAlert(_ text: String) {
        let alert = NSAlert()
        alert.messageText = text
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
}

