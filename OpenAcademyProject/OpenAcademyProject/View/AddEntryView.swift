//
//  AddEntryView.swift
//  OpenAcademyProject
//
//  Created by Francisco Losada on 03/12/25.
//

import SwiftUI
import PhotosUI
import SwiftData

struct AddEntryView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
        
    @State var day: Date = Date()
    @State var title: String = ""
    @State var text: String = ""
    @State var image: Data?
    @State var pickerImage: PhotosPickerItem?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    DatePicker("", selection: $day, displayedComponents: .init(arrayLiteral: .date))
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
                        Image(uiImage: UIImage(data: image!)!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            print("apertou")
                            context.insert(Diary(date: day, text: text, title: title, image: image))

                            dismiss()
                        } label: {
                            Image(systemName: "checkmark")
                        }
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

#Preview {
    AddEntryView()
}
