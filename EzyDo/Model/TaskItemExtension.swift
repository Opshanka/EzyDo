//
//  TaskItemExtension.swift
//  EzyDo
//
//  Created by Opshanka Prabath on 1/3/24.
//

import SwiftUI
/// checking task progress
extension TaskItem
{
    func isCompleted() -> Bool {
        return completedDate != nil
    }
    
}
