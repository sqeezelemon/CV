// CV
// ↳ ResumeViewer.swift
//
// Created by @sqeezelemon

import SwiftUI

struct ResumeViewer: View {
  @State private var renderer: Renderer = .monochrome
  @State private var cvPopoverIsShown = false
  @State private var palette = Palette(schemaName: "", colors: [])
  @State public var resume: Resume? = .example
  @State private var title: String?
  let urlPositions = URLPositions()
  
  var body: some View {
    NavigationStack {
      ScrollView(.vertical, showsIndicators: false) {
        resumeView
      }
      .frame(maxWidth: .infinity)
      .background(.thinMaterial)
      .navigationTitle(title ?? "CV")
      .toolbar {
        ToolbarItem(placement: .navigation) {
          cvPickerToolbar
        }
        ToolbarItemGroup(placement: .primaryAction) {
          paletteToolbar
          HStack { Divider() }
          saveToolbar
        }
      }
    }
    .frame(maxWidth: .infinity)
  }
  
  //MARK: Toolbar
  
  private var cvPickerToolbar: some View {
    Button(action: { cvPopoverIsShown = true }) {
      Image(systemName: "doc")
        .popover(isPresented: $cvPopoverIsShown) {
          ForEach(Resume.resumes, id: \.name) { namedResume in
            Text(namedResume.name)
              .padding(.vertical, 4)
              .font(.system(size: 14))
              .onTapGesture {
                resume = namedResume.resume
                title = namedResume.name
              }
          }
          .padding(.horizontal, 20)
        }
    }
  }
  
  private var paletteToolbar: some View {
    ForEach($palette.colors, id: \.name) { $namedColor in
        ColorPicker(namedColor.name,
                    selection: $namedColor.color,
                    supportsOpacity: false)
        .overlay(namedColor.color.allowsHitTesting(false))
        .frame(width: 24, height: 24)
        .clipShape(Circle())
        .help(namedColor.name)
    }
  }
  
  private var saveToolbar: some View {
    Button(action: { @MainActor in self.save() }) {
      Image(systemName: "square.and.arrow.up")
    }
    .disabled(resume == nil)
  }
  
  //MARK: PDF Rendering
  
  @MainActor func save() {
    let sp = NSSavePanel()
    sp.title = "Save resume"
    sp.nameFieldStringValue = "cv.pdf"
    sp.allowedContentTypes = [.pdf]
    guard sp.runModal() == .OK,
          let url = sp.url else {
      return
    }
    
    let renderer = ImageRenderer(content: resumeView)
    renderer.render { size, context in
      var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)
      guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else { return }
          
      pdf.beginPDFPage(nil)
      context(pdf)
      for position in urlPositions {
        guard let url = URL(string: position.url) else { continue }
        pdf.setURL(url as CFURL, for: position.position)
      }
      pdf.endPDFPage()
      pdf.closePDF()
    }
  }
}

//MARK: Renderers

extension ResumeViewer {
  enum Renderer: String, CaseIterable {
    case monochrome = "Monochrome"
  }
  
  @ViewBuilder var resumeView: some View {
    if let resume {
      resumeView(resume)
    } else {
      Text("Import a resume")
    }
  }
  
  func resumeView(_ resume: Resume) -> some View {
    return MonochromeResumeRenderer(resume: resume, palette: $palette, urlPositions: urlPositions)
    // When multiple renderers would be present, rewrite as if/else (switch is problematic in SwiftUI)
  }
}

#Preview {
  ResumeViewer(resume: .example)
}
