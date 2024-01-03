//
//  DateHolder.swift
//  EzyDo
//
//  Created by Opshanka Prabath on 1/3/24.
//

import SwiftUI
import CoreData

class DateHolder: ObservableObject
{
    /// this will save context
    init(_ context: NSManagedObjectContext){
        
    }
    
    /// using context this will manipulate globally
    func saveContext(_ context: NSManagedObjectContext) {
       do {
           try context.save()
       } catch {
           // Replace this implementation with code to handle the error appropriately.
           // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
           let nsError = error as NSError
           fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
       }
   }
}
