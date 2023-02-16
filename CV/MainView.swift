// CV
// ↳ MainView.swift
//
// Created by:
// Alexander Nikitin - @sqeezelemon

import SwiftUI

struct MainView: View {
  @State private var selectedResume: NamedResume = Constants.resumes[0]
  @State private var urlLocations: [URL : CGRect] = [:]
  var body: some View {
    NavigationStack {
      ScrollView() {
        ResumeView(urlLocations: $urlLocations,
                   resume: selectedResume.resume)
        // A4 Size
          .frame(width: 595,
                 height: 842)
          .background(Color.white)
          .preferredColorScheme(.light)
      }
      .toolbar {
        ToolbarItemGroup(placement: .automatic) {
          Picker("Resume", selection: $selectedResume) {
            ForEach(Constants.resumes, id: \.name) { resume in
              Text(resume.name)
                .tag(resume)
            }
          }
          .frame(minWidth: 120)
          
          Button(action: { save(resume: selectedResume.resume) }) {
            Image(systemName: "square.and.arrow.down")
          }
        }
      }
    }
  }
  
  @MainActor func save(resume: Resume, url: URL? = nil) {
    let renderer = ImageRenderer(
      content: ResumeView(urlLocations: $urlLocations,
                          resume: resume)
        .frame(width: 595,
               height: 842))
    
    let sp = NSSavePanel()
    sp.title = "Save resume"
    sp.nameFieldStringValue = "cv.pdf"
    sp.allowedContentTypes = [.pdf]
    sp.runModal()
    
    guard let url = url ?? sp.url else { return }
    
    renderer.render { size, context in
      var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)
      guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else { return }
      
      pdf.beginPDFPage(nil)
      context(pdf)
      for (link, rect) in urlLocations {
        pdf.setURL(link as CFURL, for: rect)
      }
      pdf.endPDFPage()
      pdf.closePDF()
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
