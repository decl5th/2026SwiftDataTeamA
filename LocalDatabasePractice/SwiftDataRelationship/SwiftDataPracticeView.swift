import SwiftData
import SwiftUI

struct SwiftDataPracticeView: View {
    @Environment(\.modelContext) private var modelContext

    @Query(sort: \NoteFolder.name, order: .forward)
    private var folders: [NoteFolder]

    @State private var isShowingNewFolderView = false

    var body: some View {
        NavigationStack {
            List {
                if folders.isEmpty {
                    ContentUnavailableView(
                        "폴더 없음",
                        systemImage: "folder",
                        description: Text("오른쪽 위 + 버튼으로 새 폴더를 만들어보세요.")
                    )
                } else {
                    ForEach(folders) { folder in
                        NavigationLink {
                            FolderNotesView(folder: folder)
                        } label: {
                            FolderRow(folder: folder)
                        }
                    }
                    .onDelete(perform: deleteFolders)
                }
            }
            .navigationTitle("폴더")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingNewFolderView = true
                    } label: {
                        Label("새 폴더", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingNewFolderView) {
                NewFolderView()
            }
        }
    }

    private func deleteFolders(_ offsets: IndexSet) {
        for offset in offsets {
            modelContext.delete(folders[offset])
        }
    }
}

#Preview {
    SwiftDataPracticeView()
        .modelContainer(for: [PracticeNote.self, NoteFolder.self], inMemory: true)
}
