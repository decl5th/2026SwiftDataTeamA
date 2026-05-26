//
//  PracticeNote.swift
//  LocalDatabasePractice
//
//  Created by Admin on 5/18/26.
//

import Foundation
import SwiftData

// @Model을 붙이면 SwiftData가 저장할 수 있는 모델이 된다.
// 값 타입 struct가 아니라 class를 쓰는 점도 SwiftData 모델의 특징이다.
@Model
final class PracticeNote {
    // SwiftData가 저장할 프로퍼티들이다.
    // 복잡한 타입을 넣기 전에는 이 타입이 SwiftData에 맞는지 확인해야 한다.
    var title: String
    var body: String
    var createdAt: Date
    var isPinned: Bool
    var folder: Folder? // 이게 추가되어야 한다. optional은 init 필요 없다.

    init(title: String, body: String, createdAt: Date = .now, isPinned: Bool = false) {
        self.title = title
        self.body = body
        self.createdAt = createdAt
        self.isPinned = isPinned
    }
}

@Model
final class Folder {
    var folderName: String
    
    @Relationship(deleteRule: .cascade) // 이걸 추가해줘서 폴더가 삭제되면 노트도 사라지는..
    var notes: [PracticeNote] = [] // 이 폴더 안에는 노트 목록이 있고, 처음엔 빈값
    
    init(folderName: String) {
        self.folderName = folderName
    }
}
