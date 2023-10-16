//
//  DetailsView.swift
//  notes Watch App
//
//  Created by Ahmed Ezz on 15/10/2023.
//

import SwiftUI

struct DetailsView: View {
    var note: Note
    var totalSize: Int
    var currentItem: Int
    
    @State private var isCreatedByDisplayed: Bool = false
    @State private var isSettingsViewDisplayed: Bool = false
    
    
    var body: some View {
        VStack(alignment: .center) {
            HeaderView()
            Spacer()
            ScrollView {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            HStack {
                Image(systemName: "gear")
                    .onTapGesture {
                        isSettingsViewDisplayed.toggle()
                    }
                    .sheet(isPresented: $isSettingsViewDisplayed, content: {
                        SettingsView()
                    })
                Spacer()
                Text("\(currentItem)/\(totalSize)")
                Spacer()
                Image(systemName: "info.circle")
                    .onTapGesture {
                        isCreatedByDisplayed.toggle()
                    }
                    .sheet(isPresented: $isCreatedByDisplayed, content: {
                        CreatedByView()
                    })
            }
        }
    }
}

#Preview {
    DetailsView(note: Note(text: "Ahmed Ezz"), totalSize: 10, currentItem: 3)
}
