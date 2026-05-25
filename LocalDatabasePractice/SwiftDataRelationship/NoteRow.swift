//
//  NoteRow.swift
//  LocalDatabasePractice
//
//  Created by Mason's Mac on 5/25/26.
//

import SwiftData
import SwiftUI

struct NoteRow: View {
    @Bindable var note: PracticeNote

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(note.title)
                    .font(.headline)

                Spacer()

                Button {
                    note.isPinned.toggle()
                } label: {
                    Image(systemName: note.isPinned ? "pin.fill" : "pin")
                }
                .buttonStyle(.borderless)
                .accessibilityLabel(note.isPinned ? "고정 해제" : "고정")
            }

            if note.body.isEmpty == false {
                Text(note.body)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Text(note.createdAt.formatted(date: .abbreviated, time: .shortened))
                .font(.caption)
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, 4)
    }
}
