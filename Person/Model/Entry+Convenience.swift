//
//  Entry+Convenience.swift
//  Person CoreData
//
//  Created by Lewis Jones on 31/08/2018.
//  Copyright © 2018 Rodrigo. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context){
        
        
        self.init(context: context)
        
        self.name = name
        
    }
    
}
