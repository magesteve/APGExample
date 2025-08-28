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
        
        APGWorkAppHelper.appInit()
        
        APGWorkAppHelper.shared.workRGB = .green
        APGWorkAppHelper.shared.addAdditionalMenuIntents(about: ["myDetails"], help: ["myHelp"])

        APGWorkAppHelper.shared.aboutAcknowledgmentsLink = "https://example.com"
        APGWorkAppHelper.shared.aboutLicensesLink = "https://example.com"
        
        APGWorkAppHelper.shared.whatsNewFeaturesList.append(APGWorkFeatureItem(title: "New Detail 1",
                                                              description: "This is more details!",
                                                             symbolName: "star.fill"))
        APGWorkAppHelper.shared.whatsNewFeaturesList.append(APGWorkFeatureItem(title: "New Detail 2",
                                                              description: "This is more details!",
                                                              symbolName: "pencil"))
        APGWorkAppHelper.shared.whatsNewFeaturesList.append(APGWorkFeatureItem(title: "New Detail 3",
                                                              description: "This is more details!",
                                                              symbolName: "gearshape.fill"))
        APGWorkAppHelper.shared.whatsNewFeaturesListLink = "https://example.com"
 
        APGWorkAppHelper.shared.getStartedFeaturesList.append(APGWorkFeatureItem(title: "Original Detail 1",
                                                              description: "This is more details!",
                                                             symbolName: "star.fill"))
        APGWorkAppHelper.shared.getStartedFeaturesList.append(APGWorkFeatureItem(title: "Original Detail 2",
                                                              description: "This is more details!",
                                                              symbolName: "pencil"))
        APGWorkAppHelper.shared.getStartedFeaturesList.append(APGWorkFeatureItem(title: "Original Detail 3",
                                                              description: "This is more details!",
                                                              symbolName: "gearshape.fill"))
        APGWorkAppHelper.shared.getStartedFeaturesListLink = "https://example.com"
        
        APGWorkAppHelper.shared.welcomeSubTitle = "This is a Example App"
        APGWorkAppHelper.shared.welcomeImageNames = ["welcome-1", "welcome-2", "welcome-3", "welcome-4", "welcome-5"]
        
        APGWorkAppHelper.shared.faqTopics = [
            APGWorkFAQTopic(title: "Getting Started", entries: [
                APGWorkFAQEntry(question: "How do I create a new document?",
                                answer: "Use File > Save or press Command-S."),
                APGWorkFAQEntry(question: "How do I save?",
                                answer: "Use File > Save or press Command-S.")

            ]),
            APGWorkFAQTopic(title: "Becoming Pro", entries: [
                APGWorkFAQEntry(question: "How do I have it read to me?",
                                answer: "Use the Voice Inspector."),
                APGWorkFAQEntry(question: "How do I use the AI?",
                                answer: "Wait util Rev 2.0 is released.")
            ])

        ]
        APGWorkAppHelper.shared.faqReferences = [
            APGWorkFAQReference(title: "User Guide", ref: "https://example.com/guide"),
            APGWorkFAQReference(title: "License", ref: "https://example.com/license")
        ]
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
        
        APGIntentMacTools.addMenuBeforeHelp(named: "Tools", tokens: [
            "myFlag",
            "",
            APGIntent.about,
            APGIntent.getStarted,
            APGIntent.whatsnew,
            APGIntent.welcome,
            APGIntent.faq,
            APGIntent.promos,
            APGIntent.settings
        ])

        // Place Work in Menus
        
        APGWorkAppHelper.appPrepare()
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

}

