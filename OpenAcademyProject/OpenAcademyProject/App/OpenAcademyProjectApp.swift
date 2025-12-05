//
//  OpenAcademyProjectApp.swift
//  OpenAcademyProject
//
//  Created by Francisco Losada on 03/12/25.
//

import SwiftUI
import SwiftData

@main
struct OpenAcademyProjectApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: Diary.self)
    }
}
