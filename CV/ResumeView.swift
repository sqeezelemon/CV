// CV
// ↳ ResumeView.swift
//
// Created by:
// Alexander Nikitin - @sqeezelemon

import SwiftUI

struct ResumeView: View {
  /// Spacing between info
  /// i.e. Between avatar and name
  let columnSpacer: CGFloat = Constants.columnSpacer
  let leftColumnSize: CGFloat = Constants.leftColumnSize
  
  @Binding public var urlLocations: [URL : CGRect]
  
  public var resume: Resume
  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      header
      ForEach(resume.sections, id: \.header) { section in
        sectionHeader(section)
        ForEach(section.items, id: \.title) { item in
          sectionItem(item)
        }
      }
      Spacer()
        .frame(maxHeight: .infinity)
    }
    .padding(.vertical, 50)
    .padding(.horizontal, 80)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
  
  //MARK: Header
  var header: some View {
    HStack(alignment: .center, spacing: columnSpacer) {
      Image(nsImage: .init(byReferencing: resume.imageUrl))
        .resizable()
        .frame(width: leftColumnSize,
               height: leftColumnSize)
        .clipShape(Circle())
      
      VStack(alignment: .leading, spacing: 2) {
        Text(resume.name)
          .font(.system(.largeTitle, weight: .bold))
        Text(resume.subtitle)
          .font(.system(.body, weight: .regular))
          .foregroundColor(.secondary)
      }
      Spacer()
    }
  }
  
  //MARK: Section Header
  func sectionHeader(_ section: Section) -> some View {
    HStack(alignment: .center, spacing: columnSpacer) {
      Rectangle()
        .frame(width: leftColumnSize, height: 4)
      Text(section.header)
        .font(.system(.title2, weight: .bold))
    }
    .foregroundColor(.gray)
  }
  
  //MARK: Section Item
  func sectionItem(_ item: SectionItem) -> some View {
    HStack(alignment: .top, spacing: columnSpacer) {
      Text(item.leftAccessory)
        .font(.system(.headline, weight: .regular))
        .foregroundColor(.secondary)
        .frame(width: leftColumnSize, alignment: .trailing)
      VStack(alignment: .leading, spacing: 2) {
        if let link = item.titleLink {
          Text(item.asNonLink ? item.title : "\(item.title) 􀄯")
            .font(.system(.headline, weight: .bold))
            .foregroundColor(.primary)
            .underline(color: item.asNonLink ? .clear : .primary.opacity(0.2))
            .background {
              // Hack to not have it expand in 
              GeometryReader { geo in
                Color.clear
                  .onAppear {
                    let frame = geo.frame(in: CoordinateSpace.global)
                    urlLocations[link] = CGRect(
                      x: frame.minX,
                      y: 842 - frame.maxY,
                      width: frame.width,
                      height: frame.height)
                  }
                  .onDisappear {
                    urlLocations.removeValue(forKey: link)
                  }
              }
            }
        } else {
          Text(item.title)
            .font(.system(.headline, weight: .bold))
        }
        
        if let description = item.body {
          Text(description)
            .font(.system(.subheadline))
            .foregroundColor(.secondary)
        }
      }
    }
  }
}

struct ResumeView_Previews: PreviewProvider {
  @State static private var urlLocations: [URL:CGRect] = [:]
  static var previews: some View {
    ResumeView(urlLocations: $urlLocations,
               resume: .example)
    .frame(width: 595,
           height: 842)
  }
}
