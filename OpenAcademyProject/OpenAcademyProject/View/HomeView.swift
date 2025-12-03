//
//  ContentView.swift
//  OpenAcademyProject
//
//  Created by Francisco Losada on 03/12/25.
//

import SwiftUI

struct HomeView: View {
    @State var entryList: [Diary] = []
    @State var toggleSheet: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(entryList) { entry in
                    HomeEntryView(entry: entry)
                }
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
            .fullScreenCover(isPresented: $toggleSheet) {
                AddEntryView()
            }
        }
    }
}

#Preview {
    HomeView(entryList: [])
}
