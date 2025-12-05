//
//  EntryView.swift
//  OpenAcademyProject
//
//  Created by Francisco Losada on 05/12/25.
//

import SwiftUI
import SwiftData

struct EntryView: View {
    @Environment(\.modelContext) private var context
    
    @State var showEdit: Bool = false

    var entry: Diary
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text(entry.title)
                        .largeTitleStyle()
                    
                    Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                        .dateStyle()
                    
                    Divider()
                    
                    Text(entry.text)
                        .textStyle()
                    
                    if entry.image != nil {
                        HStack {
                            Spacer()
                            Image(uiImage: UIImage(data: entry.image!)!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 450)
                            Spacer()
                        }
                    }
                }
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    showEdit = true
                } label: {
                    Image(systemName: "pencil")
                }
            }
        }
        .sheet(isPresented: $showEdit) {
            EditEntryView(entry: entry)
        }
    }
}

#Preview {
    EntryView(entry: Diary(date: Date(), text: "TesadfhuishfiusdhfiusdhufihsadiufhsdiufhsdaiuhfiusdahfiusdhfuisdhaiufhsadiufhsdauihfiusdahfuisadhfiudsahfiuhsduifhsdiufhsaiduhfiusdhfiusadhiufhsadiuhsteTeste", title: "titulo"))
}
