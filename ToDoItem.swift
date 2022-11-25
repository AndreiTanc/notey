//
//  ToDoItem+CoreDataProperties.swift
//  ToNotey
//
//  Created by Andrei Tanc on 22.11.2022.
//
//

import Foundation
import CoreData

@objc(ToDoItem)
public class ToDoItem: NSManagedObject, Identifiable {
    
    @NSManaged public var title: String
    @NSManaged public var recordingUrl: String?
    @NSManaged public var isDone: Bool
    @NSManaged public var isHighPriority: Bool
    @NSManaged public var details: String?
    @NSManaged public var shouldWarn: Bool
    @NSManaged public var date: Date
    @NSManaged public var completingDate: Date?
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoItem> {
        return NSFetchRequest<ToDoItem>(entityName: "ToDoItem")
    }
}

extension ToDoItem: NoteyDataProtocol {
    func initWithData(_ data: [String : Any]) {
        title = data[KeyConstants.ToDo.title.rawValue] as? String ?? "Unknown Task"
        details = data[KeyConstants.ToDo.details.rawValue] as? String
        recordingUrl = data[KeyConstants.ToDo.recordingURL.rawValue] as? String
        date = data[KeyConstants.ToDo.date.rawValue] as? Date ?? Date()
        shouldWarn = data[KeyConstants.ToDo.shouldWarn.rawValue] as? Bool ?? false
        isHighPriority = data[KeyConstants.ToDo.isHighPriority.rawValue] as? Bool ?? false
        isDone = data[KeyConstants.ToDo.isDone.rawValue] as? Bool ?? false
        completingDate = data[KeyConstants.ToDo.completingDate.rawValue] as? Date
    }
}

extension Array where Element == ToDoItem {
    enum SortingCriateria {
        case date
        case priority
    }
    
    func sort(basedOn criteria: SortingCriateria) -> [ToDoItem] {
        self.sorted(by: {
            switch criteria {
            case .date:
                return $0.date > $1.date
            case .priority:
                return $0.isHighPriority && !$1.isHighPriority
            }
        })
    }
    
    func filterForToday() -> [ToDoItem] {
        self.filter {
            $0.isHighPriority ||
            Calendar(identifier: .gregorian)
                .isDateInToday($0.date)
        }
    }
}
