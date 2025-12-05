//
//  DiaryViewModel.swift
//  OpenAcademyProject
//
//  Created by Francisco Losada on 03/12/25.
//

import SwiftUI
import Foundation
import SwiftData

@Model
class Diary: Identifiable {
    var id: UUID = UUID()
    var date: Date
    var text: String
    var title: String
    var image: Data?
    
    init(date: Date, text: String, title: String, image: Data? = nil) {
        self.date = date
        self.text = text
        self.title = title
        self.image = image
    }
}

extension Text {
    func titleStyle() -> some View {
        self
            .foregroundStyle(Color.accentColor)
            .fontWeight(.bold)
            .font(.title)
    }
    
    func largeTitleStyle() -> some View {
        self
            .foregroundStyle(Color.accentColor)
            .fontWeight(.bold)
            .font(.largeTitle)
    }
    
    func textStyle() -> some View {
        self
            .foregroundStyle(.black)
            .fontWeight(.regular)
            .font(.body)
            .multilineTextAlignment(.center)
    }
    
    func dateStyle() -> some View {
        self
            .foregroundStyle(.gray)
            .font(.subheadline)
            .fontWeight(.regular)
    }
}


