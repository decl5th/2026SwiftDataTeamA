# Persistence Co Lab
로컬 데이터 저장 방식을 직접 써 보고 비교하는 Tech Map Team A입니다.



## 구성

| 주차 | 방식 | 내용 | 결과물 |
| --- | --- | --- | --- |
| Week 1 | 킥오프 30분 | 저장 방식 소개, 학습할 주제 선택, 페어 배정 | 학습 목표 |
| Week 2 | 자율 학습 | 공식 문서 읽기, 추가 리소스 찾기, 작은 샘플 만들기 | 샘플 앱, 학습 노트 |
| Week 3 | Wrap 60분 | 데모, 코드 워크쓰루, 서로 리뷰 | README, 리뷰 코멘트 |

## 배울 수 있는 것

- 앱을 껐다 켜도 데이터가 남는 흐름을 직접 확인합니다.
- 저장, 읽기, 삭제 코드가 어디에서 실행되는지 설명합니다.
- 장점과 한계를 README에 정리하고 다른 페어의 코드를 리뷰합니다.

### SwiftData

앱 안에서 계속 만들고 수정하고 삭제하는 구조화된 데이터에 적합합니다. 목록 화면에서 여러 항목을 보여주고, 조건에 따라 정렬하거나 필터링할 때 주로 씁니다.

- 좋은 예시: 노트, 할 일, 북마크, 일기
- 피할 예시: 단일 설정값, 단순 파일 캐시
- 볼 코드: `@Model`, `ModelContainer`, `@Query`, `modelContext.insert`, `modelContext.delete`

## 제출 README에 들어가면 좋은 내용

- 선택한 저장 방식과 이유
- 장점 2개 이상
- 한계 2개 이상
- 내 프로젝트에 적용할 때 조심할 점
- 실행 방법
- 참고 리소스
- 페어 리뷰 링크

## 참고 공식 문서
- ModelContainer  
  https://developer.apple.com/documentation/swiftdata/modelcontainer
