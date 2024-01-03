//
//  EzyDoApp.swift
//  EzyDo
//
//  Created by Opshanka Prabath on 1/3/24.
//

import SwiftUI

@main
struct EzyDo: App {
    let persistenceController = PersistenceController.shared
    @EnvironmentObject var dateHolder: DateHolder

    var body: some Scene {
        WindowGroup {
            
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).environmentObject(dateHolder)
      
        }
      
    }
}
