//
//  ContentView.swift
//  EzyDo
//
//  Created by Opshanka Prabath on 1/3/24.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<TaskItem>

    var body: some View {
        ///Main view with task list
        NavigationView {
          VStack
            {
                ZStack
                {
                    /// present list of tasks
                    List {
                        ForEach(items) { item in
                            NavigationLink(destination: TaskEditView(passedTaskItem: item, initialDate: Date()).environmentObject(dateHolder))
                            {
                                TaskCell(passedTaskItem: item).environmentObject(dateHolder)
                            }
                        }
                        .onDelete(perform: deleteItems).padding(5)
                    }
                    /// if there is no any task this will text will appear
                    Text(items.count == 0 ? "Please add a task" : "")
                    
                    /// this enabled edit button
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    }
                    
                }
                
                /// bottom - add new task button
                FloatingButton().environmentObject(dateHolder)
            }
            .navigationTitle("To Do List")
        }
     
    }


    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            dateHolder.saveContext(viewContext)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
