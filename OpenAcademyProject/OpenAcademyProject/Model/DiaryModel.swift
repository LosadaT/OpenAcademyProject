//
//  DiaryViewModel.swift
//  OpenAcademyProject
//
//  Created by Francisco Losada on 03/12/25.
//

import SwiftUI

struct Diary: Identifiable {
    let id: UUID = UUID()
    var date: Date
    var text: String
    var title: String
}

//extension Date {
//    public var date: Int {
//        Calendar.current.dateComponents([.day], from: self).day ?? 0
//        
//    }
//}


