// CoreData.swift

// BlitzBoard
// Created by Kiasha Rangasamy on 2024/04/22.
//

import UIKit
import CoreData

// MARK: - Core Data stack
var persistentContainer: NSPersistentContainer = {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        fatalError("Unable to access AppDelegate")
    }
    let container = appDelegate.persistentContainer
    container.loadPersistentStores {_, error in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    return container
}()

// MARK: - Core Data Saving support
func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
