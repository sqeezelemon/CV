// CV
// ↳ CVApp.swift
//
// Created by @sqeezelemon

import SwiftUI

@main
struct CVApp: App {
  var body: some Scene {
    WindowGroup {
//        ResumeView(cv: .me)
        MainView()
    }
    .windowStyle(.hiddenTitleBar)
  }
}
