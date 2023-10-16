//
//  HeaderView.swift
//  notes Watch App
//
//  Created by Ahmed Ezz on 15/10/2023.
//

import SwiftUI

struct HeaderView: View {
    var title: String? = nil
    var body: some View {
        VStack {
            if let nonNullTitle = title {
                if nonNullTitle != "" {
                    Text(nonNullTitle.uppercased())
                        .fontWeight(.bold)
                        .foregroundStyle(.accent)
                }
            }
            HStack {
                Capsule()
                    .frame(height: 2)
                    .foregroundStyle(.accent)
                Image(systemName: "note.text")
                    .foregroundStyle(.accent)
                Capsule()
                    .frame(height: 2)
                    .foregroundStyle(.accent)
            }
        }
    }
}

#Preview {
    HeaderView(title: "Credits")
}
