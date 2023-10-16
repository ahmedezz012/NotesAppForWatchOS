//
//  NoteModel.swift
//  notes Watch App
//
//  Created by Ahmed Ezz on 13/10/2023.
//

import Foundation


struct Note : Codable, Identifiable {
    var id = UUID()
    var text: String
}
