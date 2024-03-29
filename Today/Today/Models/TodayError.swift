//
//  TodayError.swift
//  Today
//
//  Created by 서찬호 on 2023/03/10.
//

import Foundation

enum TodayError: LocalizedError {
    
    case accessDenied
    case accessRestricted
    case failedReadingCalendarItem
    case failedReadingReminders
    case reminderHasNoDueDate
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .accessDenied:
            return NSLocalizedString("The app doesn't have permission to read reminders.", comment: "access denied error description")
        case .accessRestricted:
            return NSLocalizedString("This Device doesn't allow access to reminders.", comment: "access restricted error description")
        case .failedReadingCalendarItem:
            return NSLocalizedString("Failed to read a calendar item", comment: "failed reading calendar item error decription")
        case .failedReadingReminders:
            return NSLocalizedString("Failed to read reminders", comment: "failed reading reminders error description")
        case .reminderHasNoDueDate:
            return NSLocalizedString("A reminder has no due date", comment: "reminder has no due date error description")
        case .unknown:
            return NSLocalizedString("An unkwon error occurred", comment: "unkwown error description")
        }
    }
}
