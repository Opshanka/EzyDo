//
//  TaskEditView.swift
//  EzyDo
//
//  Created by Opshanka Prabath on 1/3/24.
//

import SwiftUI

struct TaskEditView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dateHolder: DateHolder

    
    
    @State var selectedTaskItem: TaskItem?
    @State var name: String
    @State var desc: String
    @State var dueDate: Date
    @State var scheduleTime: Bool
    
    init(passedTaskItem: TaskItem?, initialDate: Date){
        if let taskItem = passedTaskItem
        {
            _selectedTaskItem = State(initialValue: taskItem)
            _name = State(initialValue: taskItem.name ?? "")
            _desc = State(initialValue: taskItem.desc ?? "")
            _dueDate = State(initialValue: taskItem.dueDate ?? initialDate)
            _scheduleTime = State(initialValue: taskItem.scheduleTime)

        }
        else{
            _name = State(initialValue: "")
            _desc = State(initialValue: "")
            _dueDate = State(initialValue: initialDate)
            _scheduleTime = State(initialValue: false)
        }
    }
    
    var body: some View {
        Form
        {
            Section(header: Text("Task"))
            {
                TextField("Task Name", text: $name)
                TextField("Desc", text: $desc)
            }
            Section(header: Text("Due Date"))
            {
                Toggle("Schedule Time", isOn: $scheduleTime)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: displayComps())
            }
            /// Checking progress of task
            if selectedTaskItem?.isCompleted() ?? false
            {
                Section(header: Text("Completed"))
                {
                    Text(selectedTaskItem?.completedDate?.formatted(date: .abbreviated, time: .shortened) ?? "").foregroundColor(.green)
                }
            }
            Section()
            {
                Button("Save", action: saveAction)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    /// return date picker components with customization
    func displayComps() -> DatePickerComponents
    {
        return scheduleTime ? [.hourAndMinute, .date]: [.date]
    }
    
    /// When click save button
    func saveAction()
    {
        withAnimation
        {
            if selectedTaskItem == nil
            {
                        selectedTaskItem = TaskItem(context: viewContext)
            }
            selectedTaskItem?.created = Date()
            selectedTaskItem?.name = name
            selectedTaskItem?.desc = desc
            selectedTaskItem?.dueDate = dueDate
            selectedTaskItem?.scheduleTime = scheduleTime
            
            /// save the data on coredata
            dateHolder.saveContext(viewContext)
            
            //close the edit view and go back to main page
            self.presentationMode.wrappedValue.dismiss()

        }
    }
}

#Preview {
    TaskEditView(passedTaskItem: TaskItem(), initialDate: Date())
}
