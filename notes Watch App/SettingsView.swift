//
//  SettingsView.swift
//  notes Watch App
//
//  Created by Ahmed Ezz on 17/10/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage(.linesCount) private var linesCount = 1
    @State private var value: Float = 1
    
    var body: some View {
        
        return VStack {
            HeaderView(title: "Settings")
            
            Text("Lines \(linesCount)".uppercased())
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Slider(value: $value, in: 1...4, step: 1)
                .onChange(of: value) { oldValue, newValue in
                    value = newValue
                    updateLineCount()
                }
        }
    }
    private func updateLineCount() {
        linesCount = Int(value)
    }
}

#Preview {
    SettingsView()
}
