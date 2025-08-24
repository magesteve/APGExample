//
//  AppDelegate.swift
//  APGExample
//
//  Created by Steve Sheets on 8/20/25.
//

import Cocoa
import APGIntentKit
import APGWorkKit

var gMyFlag = false

@MainActor
@main
class AppDelegate: NSObject, NSApplicationDelegate {

    // Designated initializer
    override init() {
        super.init()

        // Setup Intents Info
        
        APGIntentInfoList.shared.add(contentsOf: [
            APGIntentInfo(token: "myWelcome", name: "Welcome", symbolName: "sun.max"),
            APGIntentInfo(token: "myHelp",    name: "Additional Help",    symbolName: "hand.wave"),
            APGIntentInfo(token: "myDetails", name: "Details", symbolName: "macwindow"),
            
            APGIntentInfo(token: "myFlag",    name: "Flag",    alwaysOn: false, symbolName: "flag")
        ])

        // Setup Work
        
        APGWorkMacApp.appInit()
        
        APGWorkGlobals.shared.workUIColor = .green
        APGWorkGlobals.shared.addAdditionalMenuIntents(about: ["myDetails"], help: ["myHelp"])

        APGWorkGlobals.shared.aboutAcknowledgmentsLink = "https://example.com"
        APGWorkGlobals.shared.aboutLicensesLink = "https://example.com"
        
        APGWorkGlobals.shared.featuresList.append(APGWorkFeatureItem(title: "Detail 1",
                                                              description: "This is more details!",
                                                             symbolName: "star.fill"))
        APGWorkGlobals.shared.featuresList.append(APGWorkFeatureItem(title: "Detail 2",
                                                              description: "This is more details!",
                                                              symbolName: "pencil"))
        APGWorkGlobals.shared.featuresList.append(APGWorkFeatureItem(title: "Detail 3",
                                                              description: "This is more details!",
                                                              symbolName: "gearshape.fill"))
        APGWorkGlobals.shared.featuresListLink = "https://example.com"
    }

    /// Simple alert to show message
    func myAlert(_ text: String) {
        let alert = NSAlert()
        alert.messageText = text
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }

    // Setup UI
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Setup the Intent Actions
        
        APGIntentActionList.sharedApp.addAction(token: "myWelcome") { _ in
            self.myAlert("This is specialized welcome window for the app")
        }
        APGIntentActionList.sharedApp.addAction(token: "myHelp") { _ in
            self.myAlert("This is additional help window for the app")
        }
        APGIntentActionList.sharedApp.addAction(token: "myDetails") { _ in
            self.myAlert("This is additional Detail window for the app")
        }
        APGIntentActionList.sharedApp.addAction(token: "myFlag",
                                                action: { _ in gMyFlag = !gMyFlag },
                                                appearance: { _ in return (true, gMyFlag, nil) })

        // Place Intent in Menus
        
        APGIntentMacTools.addMenuBeforeHelp(named: "Tools", tokens: ["myFlag"])

        // Place Work in Menus
        
        APGWorkMacApp.appPrepare()
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

}

