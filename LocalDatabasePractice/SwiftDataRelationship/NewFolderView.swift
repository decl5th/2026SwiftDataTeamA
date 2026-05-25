//
//  NewFolderView.swift
//  LocalDatabasePractice
//
//  Created by Mason's Mac on 5/25/26.
//

import SwiftData
import SwiftUI

struct NewFolderView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var folderName = ""

    private var trimmedFolderName: String {
        folderName.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("폴더 정보") {
                    TextField("폴더 이름", text: $folderName)
                }
            }
            .navigationTitle("새 폴더")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("취소") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("생성") {
                        createFolder()
                    }
                    .disabled(trimmedFolderName.isEmpty)
                }
            }
        }
    }

    private func createFolder() {
        let folder = NoteFolder(name: trimmedFolderName)
        modelContext.insert(folder)
        dismiss()
    }
}
