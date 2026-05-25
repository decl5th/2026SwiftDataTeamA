import SwiftData
import SwiftUI

struct FolderNotesView: View {
    @Environment(\.modelContext) private var modelContext

    @Bindable var folder: NoteFolder

    @State private var isShowingNewNoteView = false

    private var sortedNotes: [PracticeNote] {
        folder.notes.sorted {
            if $0.isPinned != $1.isPinned {
                return $0.isPinned && !$1.isPinned
            } else {
                return $0.createdAt > $1.createdAt
            }
        }
    }

    var body: some View {
        List {
            if sortedNotes.isEmpty {
                ContentUnavailableView(
                    "노트 없음",
                    systemImage: "note.text",
                    description: Text("오른쪽 위 작성 버튼으로 새 노트를 만들어보세요.")
                )
            } else {
                ForEach(sortedNotes) { note in
                    NavigationLink {
                        NoteDetailView(note: note)
                    } label: {
                        NoteRow(note: note)
                    }
                }
                .onDelete(perform: deleteNotes)
            }
        }
        .navigationTitle(folder.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isShowingNewNoteView = true
                } label: {
                    Label("새 노트", systemImage: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $isShowingNewNoteView) {
            NewNoteView(folder: folder)
        }
    }

    private func deleteNotes(_ offsets: IndexSet) {
        let notesToDelete = offsets.map { sortedNotes[$0] }

        for note in notesToDelete {
            modelContext.delete(note)
        }
    }
}
