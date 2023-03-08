//
//  Reminder.swift
//  Today
//
//  Created by 서찬호 on 2023/03/07.
//

import Foundation

struct Reminder: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
}

/// where 절을 사용하여
/// extension Array where Element == Reminder  확장과 같이
/// 일반 유형을 조건부로 확장할 수 있다??
/// 'Reminder형 배열' 만 확장이 가능하다 ?
extension [Reminder] {
    func indexOfReminder(withId id: Reminder.ID) -> Self.Index {
        /// firstIndex(where: ) : 컬렉션의 요소가 주어진 조건자를 만족하는 첫 번째 인덱스를 반환합니다
        /// func firstIndex(where predicate: (Self.Element) throws -> Bool) rethrows -> Self.Index?
        /// predicate : 요소를 인수로 사용하고 전달된 요소가 일치를 나타내는지 여부를 나타내는 부울 값을 반환하는 클로저입니다.
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

#if DEBUG
extension Reminder {
    static var sampleData = [
            Reminder(
                title: "Submit reimbursement report", dueDate: Date().addingTimeInterval(800.0),
                notes: "Don't forget about taxi receipts"),
            Reminder(
                title: "Code review", dueDate: Date().addingTimeInterval(14000.0),
                notes: "Check tech specs in shared folder", isComplete: true),
            Reminder(
                title: "Pick up new contacts", dueDate: Date().addingTimeInterval(24000.0),
                notes: "Optometrist closes at 6:00PM"),
            Reminder(
                title: "Add notes to retrospective", dueDate: Date().addingTimeInterval(3200.0),
                notes: "Collaborate with project manager", isComplete: true),
            Reminder(
                title: "Interview new project manager candidate",
                dueDate: Date().addingTimeInterval(60000.0), notes: "Review portfolio"),
            Reminder(
                title: "Mock up onboarding experience", dueDate: Date().addingTimeInterval(72000.0),
                notes: "Think different"),
            Reminder(
                title: "Review usage analytics", dueDate: Date().addingTimeInterval(83000.0),
                notes: "Discuss trends with management"),
            Reminder(
                title: "Confirm group reservation", dueDate: Date().addingTimeInterval(92500.0),
                notes: "Ask about space heaters"),
            Reminder(
                title: "Add beta testers to TestFlight", dueDate: Date().addingTimeInterval(101000.0),
                notes: "v0.9 out on Friday")
        ]
}
#endif
