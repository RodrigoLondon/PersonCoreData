//
//  EntryController.swift
//  CoreData
//
//  Created by Lewis Jones on 31/08/2018.
//  Copyright © 2018 Rodrigo. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    
    static let shared  = EntryController()
    
    var entries: [Entry] {
        let request: NSFetchRequest<Entry> = Entry.fetchRequest()
        
        do {
            return try CoreDataStack.context.fetch(request)
        } catch {
            print("Error fetching entries: \(error)")
            return []
        }
    }
    
   
    // CRUD
    
    func add(entry: Entry) {
        saveToPersistentStorage()
    }
    
    
    func remove(entry: Entry) {
        if let moc = entry.managedObjectContext {
            moc.delete(entry)
            saveToPersistentStorage()
        }
    }
    
    
    
    func update(entry: Entry, with name: String) {

        entry.name = name
        saveToPersistentStorage()

    }
    
    
    
    func saveToPersistentStorage() {
        
        do {
            try CoreDataStack.context.save()
        } catch let error {
            print("Error encoding object \(error)")
        }
    }
}
