//
//  ViewController.swift
//  APGExample
//
//  Created by Steve Sheets on 8/20/25.
//

import Cocoa
import APGCantripKit

class ViewController: NSViewController {
    
    var text = AttributedString()
    private let richTextView = APGMacWidgetRichTextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        text.cantripH1("Example Code")
        text.cantripP1("This is a long body of example text to demonstrate scrolling. Add as much content as you like here—paragraphs, code samples, etc")

        richTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(richTextView)
        NSLayoutConstraint.activate([
            richTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            richTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            richTextView.topAnchor.constraint(equalTo: view.topAnchor),
            richTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Push content into the widget
        richTextView.setAttributedText(text)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

