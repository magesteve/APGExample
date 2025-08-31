//
//  AppDelegate.swift
//  APGExample
//
//  Created by Steve Sheets on 8/20/25.
//

import Cocoa
import APGCantripKit
import APGIntentKit
import APGWidgetKit
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
            APGIntentInfo(token: "myspecialhelp",    name: "Additional Help",    symbolName: "hand.wave"),
            APGIntentInfo(token: "myspecialdetails", name: "Details", symbolName: "macwindow"),
            
            APGIntentInfo(token: "myFlag",    name: "Flag",    alwaysOn: false, symbolName: "flag")
        ])

        // Setup Work
        
        APGWorkAppSpecs.appInit()
        
        APGWorkAppSpecs.shared.workRGB = .green
        APGWorkAppSpecs.shared.addAdditionalMenuIntents(
            about: ["myspecialdetails"],
            help: ["myspecialhelp"]
        )

        APGWorkAppSpecs.shared.aboutAcknowledgmentsLink = "https://example.com"
        APGWorkAppSpecs.shared.aboutLicensesLink = "https://example.com"
        
        APGWorkAppSpecs.shared.whatsNewFeaturesList = [
            APGWorkFeatureItem(title: "New Detail 1",
                               description: "This is more details!",
                               symbolName: "star.fill"),
            APGWorkFeatureItem(title: "New Detail 2",
                               description: "This is more details!",
                               symbolName: "pencil"),
            APGWorkFeatureItem(title: "New Detail 3",
                               description: "This is more details!",
                               symbolName: "gearshape.fill")
        ]
        APGWorkAppSpecs.shared.whatsNewFeaturesListLink = "https://example.com"
 
        APGWorkAppSpecs.shared.getStartedFeaturesList = [
            APGWorkFeatureItem(title: "Original Detail 1",
                               description: "This is more details!",
                               symbolName: "star.fill"),
            APGWorkFeatureItem(title: "Original Detail 2",
                               description: "This is more details!",
                               symbolName: "pencil"),
            APGWorkFeatureItem(title: "Original Detail 3",
                               description: "This is more details!",
                               symbolName: "gearshape.fill")
        ]
        APGWorkAppSpecs.shared.getStartedFeaturesListLink = "https://example.com"
        
        APGWorkAppSpecs.shared.welcomeSubTitle = "This is a Example App"
        APGWorkAppSpecs.shared.welcomeImageNames = [
            "welcome-1",
            "welcome-2",
            "welcome-3",
            "welcome-4",
            "welcome-5"
        ]
        
        APGWorkAppSpecs.shared.faqTopics = [
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
        
        APGWorkAppSpecs.shared.faqReferences = [
            APGWorkFAQReference(title: "User Guide",
                                ref: "https://example.com/guide"),
            APGWorkFAQReference(title: "License",
                                ref: "https://example.com/license")
        ]
        
        APGWorkAppSpecs.shared.promoTileList = [
            APGWorkPromoTile(title: "Parrot",
                             body: "This is details about this promo tile",
                             imageName: "promo-1",
                             linkTitle: "Nothing to do yet",
                             linkRef: nil),
            APGWorkPromoTile(title: "Elephant",
                             body: "This is details about this promo tile",
                             imageName: "promo-2",
                             linkTitle: "Nothing to do yet",
                             linkRef: nil),
            APGWorkPromoTile(title: "Bear",
                             body: "This is details about this promo tile",
                             imageName: "promo-3",
                             linkTitle: "Nothing to do yet",
                             linkRef: nil)
        ]
    }

    // Setup UI
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Register Control Panels
        
        APGWorkSoundCP.register()
        APGWorkDebugCP.register()

        // Setup the Intent Actions
        
        APGIntentActionList.sharedApp.addAction(token: "myspecialhelp") { _ in
            APGCantrip.showMessage("This is additional help window for the app")
        }
        APGIntentActionList.sharedApp.addAction(token: "myspecialdetails") { _ in
            APGCantrip.showMessage("This is additional Detail window for the app")
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
        
        APGWorkAppSpecs.appPrepare()
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

}

