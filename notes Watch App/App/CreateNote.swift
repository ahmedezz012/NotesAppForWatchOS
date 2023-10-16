//
//  ContentView.swift
//  notes Watch App
//
//  Created by Ahmed Ezz on 10/10/2023.
//

import SwiftUI

struct CreateNote: View {
    
    @State private var notes : [Note] = [Note]()
    
    @State var text = ""
    
    @AppStorage(.linesCount) private var linesCount: Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
                InputField()
                if notes.count<1 {
                    NoNotesView()
                } else {
                    NotesView()
                }
            }
            .navigationTitle("Notes")
        }.onAppear(perform: {
            loadNotes()
        })
    }
    
    private func InputField() -> some View {
        return HStack {
            TextField("Add note", text: $text)
            Button(action: {
                saveAndReset()
            }, label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: 30))
            })
            .fixedSize()
            .buttonStyle(PlainButtonStyle())
            .foregroundStyle(.accent)
        }
    }
    
    private func NotesView() -> some View {
        return  List {
            ForEach(0..<notes.count, id: \.self) { i in
                NavigationLink(destination: DetailsView(note: notes[i],totalSize: notes.count, currentItem: i+1), label: {
                    NoteItemView(noteTitle: notes[i].text, lineCount: linesCount)
                })
                
            }.onDelete(perform: { indexSet in
                notes.remove(atOffsets: indexSet)
                saveToDocumentDirectory()
            })
        }
        .scrollIndicators(.never)
    }
    
    private func NoNotesView() -> some View {
        return VStack {
            Spacer()
            Image(systemName: "note.text")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.gray)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .padding(25)
            Spacer()
        }
    }
    
    private func getDocumentDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    private func saveAndReset() {
        save()
        reset()
    }
    
    private func reset() {
        text = ""
    }
    
    private func save() {
        if text != "" {
            notes.append(Note(text: text))
            saveToDocumentDirectory()
        }
    }
    
    private func saveToDocumentDirectory() {
        do {
            let encodedData = try JSONEncoder().encode(notes)
            let path = getDocumentDirectoryPath()
            
            try encodedData.write(to: path)
        } catch {
            print("error in save the data")
        }
    }
    
    private func getDocumentDirectoryPath() ->  URL {
        return  getDocumentDirectory().appendingPathComponent("notes")
    }
    
    private func loadNotes() {
        DispatchQueue.main.async {
            do {
                let path = getDocumentDirectoryPath()
                
                let data = try Data(contentsOf: path)
                
                let decodedNotes : [Note]? = try JSONDecoder().decode([Note].self, from: data)
                if decodedNotes != nil {
                    notes = decodedNotes!
                }
            } catch {
                print("error in load the data")
            }
        }
    }
}

#Preview {
    CreateNote()
}
