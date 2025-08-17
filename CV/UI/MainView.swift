// CV
// ↳ MainView.swift
//
// Created by @sqeezelemon

import SwiftUI

struct MainView: View {

    @State private var cv: CV = .me
    @State private var pdfObjects: PDFObjects = []

    var body: some View {
        ScrollView {
            resume
                .withPdfObjectTracking(to: $pdfObjects)
                .background {
                    Rectangle().fill(.background)
                        .shadow(color: .secondary.opacity(0.2), radius: 20)
                }
                .padding(20)
        }
        .scrollIndicators(.never)
        .scrollClipDisabled()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onTapGesture {
                render()
            }
            .ignoresSafeArea()
    }

    private var resume: some View {
        ResumeView(cv: cv)
            .frame(paper: .a4)
    }

    private func render() {
        let sp = NSSavePanel()
        sp.title = "Save resume"
        sp.nameFieldStringValue = "cv.pdf"
        sp.allowedContentTypes = [.pdf]
        guard sp.runModal() == .OK,
              let url = sp.url else {
          return
        }
        resume.render(toFile: url, objects: pdfObjects)
    }

}
