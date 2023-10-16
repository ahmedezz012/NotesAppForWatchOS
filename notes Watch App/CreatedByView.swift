//
//  CreatedByView.swift
//  notes Watch App
//
//  Created by Ahmed Ezz on 16/10/2023.
//

import SwiftUI

struct CreatedByView: View {
    var body: some View {
        VStack(spacing: 3) {
            
            Image("ezz")
                .resizable()
                .scaledToFit()
                .frame(height: 75)
                .clipShape(Circle())
            
            HeaderView(title: "Created By")
            
            Text("Ahmed Ezz")
                .font(.title2)
            
            Text("Senior Mobile Developer")
                .font(.footnote)
                .fontWeight(.light)
                .opacity(0.8)
            
        }
    }
}

#Preview {
    CreatedByView()
}
