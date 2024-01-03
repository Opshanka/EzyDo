//
//  TaskCell.swift
//  EzyDo
//
//  Created by Opshanka Prabath on 1/3/24.
//

import SwiftUI

struct TaskCell: View {
    /// This will manage on cell of task list
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var passedTaskItem: TaskItem
    
    var body: some View {
        HStack(alignment: .firstTextBaseline){
            
            /// Have seperate check box cutomization
            CheckBoxView( passedTaskItem: passedTaskItem).environmentObject(dateHolder)
            
            /// If item has a name it will show here other-wise it will shows empty string.
            VStack(alignment: .leading){
                Text(passedTaskItem.name ?? "")
            }
        }
    }
}

#Preview {
    TaskCell(passedTaskItem: TaskItem())
}
