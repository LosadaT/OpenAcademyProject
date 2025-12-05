//
//  DiaryViewModel.swift
//  OpenAcademyProject
//
//  Created by Francisco Losada on 05/12/25.
//

import Foundation
import SwiftUI
import AppIntents
import SwiftData

struct WriteIntent: AppIntent {
    static var title: LocalizedStringResource = "Write new note"
    static var description = IntentDescription("Write new diary entry")
    static var openIntent = true
    
    @Parameter(title: "Note ID")
    var text: String
    
    init() { }
    
    init(text: String) {
        self.text = text
    }
    
    func perform() async throws -> some IntentResult {
        let modelContext = ModelContext(try ModelContainer(for: Diary.self))

        let newEntry = Diary(date: Date(), text: text, title: "Fast Note")
        modelContext.insert(newEntry)
        
        try modelContext.save()
        return .result()
    }
}
