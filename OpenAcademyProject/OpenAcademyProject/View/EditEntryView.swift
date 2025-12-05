//
//  EditEntryView.swift
//  OpenAcademyProject
//
//  Created by Francisco Losada on 05/12/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct EditEntryView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    
    @State var title: String
    @State var text: String
    @State var date: Date
    @State var pickerImage: PhotosPickerItem?
    @State var image: Data?
    
    var entry: Diary
    
    init(entry: Diary) {
        self.entry = entry
        _title = State(initialValue: entry.title)
        _text  = State(initialValue: entry.text)
        _date  = State(initialValue: entry.date)
        
        if let data = entry.image {
            _image = State(initialValue: data)
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    DatePicker("", selection: $date, displayedComponents: .init(arrayLiteral: .date))
                        .datePickerStyle(.automatic)
                    
                    Text("Title:")
                        .titleStyle()
                    TextField("Entry title...", text: $title)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Text: ")
                        .titleStyle()
                    
                    TextField("Tell me about your day...", text: $text, axis: .vertical)
                        .padding(.bottom)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(1...8)
                    
                    HStack {
                        Spacer()
                        PhotosPicker("Select Image", selection: $pickerImage, matching: .images)
                        Spacer()
                    }
                    
                    if image != nil {
                        HStack {
                            Spacer()
                            Image(uiImage: UIImage(data: image!)!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Edit Entry")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        entry.title = title
                        entry.text  = text
                        entry.date  = date
                        
                        if let img = image {
                            entry.image = img
                        }
                        
                        try? context.save()
                        dismiss()                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
            }
            .onChange(of: pickerImage) {
                Task {
                    if let loaded = try? await pickerImage?.loadTransferable(type: Data.self) {
                        image = loaded
                    } else {
                        print("Failed")
                    }
                }
            }
            .padding()
        }
    }
    
}
