//
//  FolderRow.swift
//  LocalDatabasePractice
//
//  Created by Mason's Mac on 5/25/26.
//

import SwiftUI

struct FolderRow: View {
    let folder: NoteFolder

    var body: some View {
        HStack {
            Label(folder.name, systemImage: "folder")

            Spacer()

            Text("\(folder.notes.count)")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
