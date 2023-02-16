// CV
// ↳ Resume+Example.swift
//
// Created by:
// Alexander Nikitin - @sqeezelemon

import Foundation

extension Resume {
  static let example = Resume(
    name: "John Doe",
    subtitle: "World renowned Lorem Ipsum",
    imageUrl: Bundle.main.url(forResource: "example", withExtension: "png")!,
    sections: [
      //MARK: Education
      Section(
        header: "Education",
        items: [
          SectionItem(
            title: "School",
            titleLink: nil,
            body: "A & B, never the Cs",
            leftAccessory: "2021-2077")
        ]),
      
      //MARK: Projects
      Section(
        header: "Projects",
        items: [
          SectionItem(
            title: "Google 2",
            titleLink: URL(string: "https://google.com"),
            body: "Long awaiteed sequel that types the query for you and you have to find the results",
            leftAccessory: "2021-2022"
          ),
          SectionItem(
            title: "Self Driving Cart",
            titleLink: URL(string: "https://tesla.com"),
            body: "Goes to supermarkets for you. Shut down because we couldn't stop it from being able to buy illegal items too",
            leftAccessory: "2017-2018"
          ),
        ]),
      
      //MARK: Skills
      Section(
        header: "Skills",
        items: [
          SectionItem(
            title: "Discrete Maths",
            titleLink: nil,
            body: "Disjoin Subsets, Binary Logic",
            leftAccessory: "CS"),
          SectionItem(
            title: "Human Relations",
            titleLink: nil,
            body: "Hiring, Nonbinary Logic",
            leftAccessory: "HR")
        ]),
      
      //MARK: Contacts
      Section(
        header: "Contacts",
        items: [
          SectionItem(
            title: "@sqeezelemon",
            titleLink: URL(string: "https://linkedin.com/in/sqeezelemon"),
            body: nil,
            leftAccessory: "LinkedIn",
            asNonLink: true),
        ]),
    ])
}
