//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by 서찬호 on 2023/03/08.
//

import UIKit

extension ReminderListViewController {
    // @objc 특성은 Objective-C 코드에서 이 메서드를 사용할 수 있도록 한다
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
    }
}
