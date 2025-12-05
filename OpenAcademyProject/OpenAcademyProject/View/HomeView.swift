//
//  ContentView.swift
//  OpenAcademyProject
//
//  Created by Francisco Losada on 03/12/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Diary.date, order: .reverse) var entries: [Diary]

    @State var toggleSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("My Diary")
                            .largeTitleStyle()
                            .padding()
                        Spacer()
                    }
                    
                    ForEach(entries) { entry in
                        NavigationLink {
                            EntryView(entry: entry)
                        } label : {
                            HomeEntryView(entry: entry)

                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $toggleSheet) {
                AddEntryView()
            }
            .toolbar {
                ToolbarItem (placement: .confirmationAction){
                    Button {
                        toggleSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }            
        }
    }
}

#Preview {
    HomeView()
}
