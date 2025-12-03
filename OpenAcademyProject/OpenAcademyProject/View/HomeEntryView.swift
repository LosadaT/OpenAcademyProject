//
//  HomeEntryView.swift
//  OpenAcademyProject
//
//  Created by Francisco Losada on 03/12/25.
//

import SwiftUI

struct HomeEntryView: View {
    var entry: Diary
    var body: some View {
        VStack {
            Text(entry.title)
            Text(entry.date.formatted(date: .abbreviated, time: .omitted))
            Divider()
            Text(entry.text)
        }
    }
}
