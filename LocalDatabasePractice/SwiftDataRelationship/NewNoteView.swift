//
//  NewNoteView.swift
//  LocalDatabasePractice
//
//  Created by Mason's Mac on 5/25/26.
//

import SwiftData
import SwiftUI

struct NewNoteView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    let folder: NoteFolder

    @State private var title = ""
    @State private var bodyText = ""

    private var trimmedTitle: String {
        title.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private var trimmedBody: String {
        bodyText.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("노트 내용") {
                    TextField("제목", text: $title)

                    TextField("본문", text: $bodyText, axis: .vertical)
                        .lineLimit(5...10)
                }

                Section("저장 위치") {
                    LabeledContent("폴더", value: folder.name)
                }
            }
            .navigationTitle("새 노트")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("취소") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("저장") {
                        saveNote()
                    }
                    .disabled(trimmedTitle.isEmpty)
                }
            }
        }
    }

    private func saveNote() {
        let note = PracticeNote(
            title: trimmedTitle,
            body: trimmedBody,
            folder: folder
        )

        modelContext.insert(note)
        dismiss()
    }
}
