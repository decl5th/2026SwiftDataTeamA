//
//  NoteDetailView.swift
//  LocalDatabasePractice
//
//  Created by Mason's Mac on 5/25/26.
//

import SwiftData
import SwiftUI

struct NoteDetailView: View {
    @Bindable var note: PracticeNote

    var body: some View {
        Form {
            Section("노트 내용") {
                TextField("제목", text: $note.title)

                TextField("본문", text: $note.body, axis: .vertical)
                    .lineLimit(5...10)

                Toggle("고정", isOn: $note.isPinned)
            }

            Section("저장 정보") {
                if let folder = note.folder {
                    LabeledContent("폴더", value: folder.name)
                }

                LabeledContent(
                    "생성일",
                    value: note.createdAt.formatted(date: .abbreviated, time: .shortened)
                )
            }
        }
        .navigationTitle(note.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
