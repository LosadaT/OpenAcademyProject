//
//  AddEntryView.swift
//  OpenAcademyProject
//
//  Created by Francisco Losada on 03/12/25.
//

import SwiftUI

struct AddEntryView: View {
    @Environment(\.dismiss) var dismiss

    @State var day: Date = Date()
    @State var title: String = ""
    @State var text: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                DatePicker("", selection: $day, displayedComponents: .init(arrayLiteral: .date))
                Text("Title:")
                TextField("Entry title...", text: $title)
                Text("Text: ")
                TextField("Tell me about your day...", text: $text)
            }
            .padding()
            Spacer()
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        print("apertou")
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
}

#Preview {
    AddEntryView()
}
