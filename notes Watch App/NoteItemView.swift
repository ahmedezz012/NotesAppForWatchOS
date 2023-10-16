//
//  NoteItemView.swift
//  notes Watch App
//
//  Created by Ahmed Ezz on 13/10/2023.
//

import SwiftUI

struct NoteItemView: View {
    
    var noteTitle: String
    
    var lineCount = 1
    
    var body: some View {
        HStack {
            Capsule()
                .fill(.accent)
                .frame(width: 4, height: 30)
                .padding(.leading, 2)
            Text(noteTitle)
                .lineLimit(lineCount)
                .padding(.leading, 5)
        }
    }
}

#Preview {
    return  NoteItemView(noteTitle: "Note 1")
        .previewLayout(.sizeThatFits)
}
