// CV
// ↳ View+Rendering.swift
//
// Created by @sqeezelemon

import SwiftUI

extension View {

    func render(
        toFile url: URL,
        objects: PDFObjects
    ) {
        let renderer = ImageRenderer(content: self)
        renderer.render { (size, context) in
            var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else { return }
            pdf.beginPDFPage(nil)
            context(pdf)
            for object in objects {
                switch object.value {
                case .url(let url):
                    var frame = object.frame
                    frame.origin.y = box.height - frame.origin.y - frame.height
                    pdf.setURL(url as CFURL, for: frame)
                }
            }
            pdf.endPDFPage()
            pdf.closePDF()
        }
    }

}
