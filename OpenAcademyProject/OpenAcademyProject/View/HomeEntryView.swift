//
//  HomeEntryView.swift
//  OpenAcademyProject
//
//  Created by Francisco Losada on 03/12/25.
//

import SwiftUI

struct HomeEntryView: View {
    @Environment(\.modelContext) private var context

    var entry: Diary
    var body: some View {
        VStack(alignment: .center) {
            Text(entry.title)
                .titleStyle()
            
            Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                .dateStyle()
            
            Text(entry.text)
                .textStyle()
        }
        .padding()
        .frame(width: 350)
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}

#Preview {
    HomeEntryView(entry: Diary(date: Date(), text: "TesteTeste", title: "titulo"))
}
