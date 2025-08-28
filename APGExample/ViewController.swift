//
//  ViewController.swift
//  APGExample
//
//  Created by Steve Sheets on 8/20/25.
//

import Cocoa
import APGCantripKit
import APGWidgetKit

/// View Controller for the document
/// It uses Cantrip kit to make some rich text, and then displays it using WidgetKit.
class ViewController: NSViewController {
    
    private let richTextView = APGWidgetRichTextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        var text = AttributedString()
        text.cantripH1("APG Example")
        text.cantripP("This sample document demonstrates many of the features of APG Kits.")
        
        text.cantripLine(width: 300.0, color: .black)
        text.cantripParagraphEnd()
        text.cantripImage(named:"steve")
        text.cantripParagraphEnd()
        text.cantripLine(width: 300.0, color: .black)
        text.cantripParagraphEnd()

        text.cantripH5("Sample Test to demonstrate scrolling.")
        text.cantripP("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales, quam in facilisis scelerisque, orci sapien euismod nulla, at efficitur magna mauris vitae magna. Donec nec lorem vel velit ultricies efficitur non nec nisl. Cras viverra, nisi non feugiat malesuada, urna felis fermentum nisl, eget ultrices ipsum mauris vitae tortor. Curabitur vestibulum orci vitae odio sagittis varius. ")
        text.cantripP("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales, quam in facilisis scelerisque, orci sapien euismod nulla, at efficitur magna mauris vitae magna. Donec nec lorem vel velit ultricies efficitur non nec nisl. Cras viverra, nisi non feugiat malesuada, urna felis fermentum nisl, eget ultrices ipsum mauris vitae tortor. Curabitur vestibulum orci vitae odio sagittis varius. ")
        text.cantripP("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales, quam in facilisis scelerisque, orci sapien euismod nulla, at efficitur magna mauris vitae magna. Donec nec lorem vel velit ultricies efficitur non nec nisl. Cras viverra, nisi non feugiat malesuada, urna felis fermentum nisl, eget ultrices ipsum mauris vitae tortor. Curabitur vestibulum orci vitae odio sagittis varius. ")
        text.cantripP("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales, quam in facilisis scelerisque, orci sapien euismod nulla, at efficitur magna mauris vitae magna. Donec nec lorem vel velit ultricies efficitur non nec nisl. Cras viverra, nisi non feugiat malesuada, urna felis fermentum nisl, eget ultrices ipsum mauris vitae tortor. Curabitur vestibulum orci vitae odio sagittis varius. ")
        text.cantripP("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales, quam in facilisis scelerisque, orci sapien euismod nulla, at efficitur magna mauris vitae magna. Donec nec lorem vel velit ultricies efficitur non nec nisl. Cras viverra, nisi non feugiat malesuada, urna felis fermentum nisl, eget ultrices ipsum mauris vitae tortor. Curabitur vestibulum orci vitae odio sagittis varius. ")

        richTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(richTextView)
        NSLayoutConstraint.activate([
            richTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            richTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            richTextView.topAnchor.constraint(equalTo: view.topAnchor),
            richTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        richTextView.setAttributedText(text)
    }

    override var representedObject: Any? {
        didSet { }
    }

}


