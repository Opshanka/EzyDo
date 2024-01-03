//
//  CheckBoxView.swift
//  EzyDo
//
//  Created by Opshanka Prabath on 1/3/24.
//

import SwiftUI

struct CheckBoxView: View {
    /// This view will manage a check box
    
    @EnvironmentObject var dateHolder: DateHolder
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var passedTaskItem: TaskItem
    
    var body: some View {
        Image(systemName: passedTaskItem.isCompleted() ? "checkmark.circle.fill" : "circle").foregroundColor(passedTaskItem.isCompleted() ? .green : .secondary).onTapGesture {
            withAnimation{
                if !passedTaskItem.isCompleted()
                {
                    passedTaskItem.completedDate = Date()
                    dateHolder.saveContext(viewContext)
                }
                else {
                    passedTaskItem.completedDate = nil
                    dateHolder.saveContext(viewContext)
                }
                
            }
        }
    }
}

#Preview {
    CheckBoxView(passedTaskItem: TaskItem())
}
