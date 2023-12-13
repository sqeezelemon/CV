// CV
// ↳ CV+Example.swift
//
// Created by @sqeezelemon

import Foundation

extension Resume {
  static let example: Resume = Resume(
    name: "John Doe",
    summary: "World renowned lorem ipsum with experience in dolor sit amet and consectetur adipiscing elit",
    skillsets: [
      .init(name: "Discrete Maths", skills: ["Disjoint Subsets", "Binary Logic"]),
      .init(name: "Human Relations", skills: ["Hiring", "Nonbinary Logic"])
    ],
    experiences: [
      .init(
        company: "M&Ms",
        role: "Creative manager",
        interval: "Jun 2017 - Present",
        details: "Updated the colors of M&Ms to reduce JPEG compression when photographed for social media",
        link: ""),
    ],
    education: [
      .init(
        institution: "University",
        program: "School",
        interval: "Sept-Oct 2077",
        description: "Didn't learn ABC because I only got A. Got expelled for it nontheless")
    ],
    projects: [
      .init(
        name: "Google 2",
        link: "https://google.com",
        description: "Long awaiteed sequel that types the query for you and you have to find the results"),
      .init(
        name: "Self Driving Cart",
        link: "https://tesla.com",
        description: "Goes to supermarkets for you. Shut down because we couldn't stop it from being able to buy illegal items too"),
    ],
    contacts: [
      .init(
        type: .linkedin,
        title: "**in**/sqeezelemon",
        link: "https://linkedin.com/in/sqeezelemon"),
      .init(
        type: .github,
        title: "**github**/sqeezelemon",
        link: "https://github.com/sqeezelemon")
    ])
}
