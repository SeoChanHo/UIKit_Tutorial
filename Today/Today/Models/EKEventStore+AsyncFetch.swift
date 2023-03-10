//
//  EKEventStore+AsyncFetch.swift
//  Today
//
//  Created by 서찬호 on 2023/03/10.
//

import EventKit
import Foundation

// 사용자의 캘린더 이벤트 및 reminder에 엑세스할 수 있습니다
extension EKEventStore {
    func reminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        try await withCheckedThrowingContinuation { continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders {
                    // 중단 지점에서 정상적으로 반환되도록 하여 계속 대기 중인 작업을 재개합니다.
                    continuation.resume(returning: reminders)
                } else {
                    // 중단 지점에서 오류를 발생시켜 계속 대기 중인 작업을 재개합니다.
                    continuation.resume(throwing: TodayError.failedReadingReminders)
                }
            }
        }
    }
}
