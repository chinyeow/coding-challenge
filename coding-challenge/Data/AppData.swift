//
//  AppData.swift
//  coding-challenge
//
//  Created by Law Chin Yeow on 24/07/2019.
//  Copyright © 2019 Law Chin yeow. All rights reserved.
//

import UIKit
import CoreData

class AppData {
    
//    private static var topics:[TopicDao] = []
//
//    /// Add new Topic Dao
//    ///
//    /// - Parameter topic: a new object of TopicDao
//    static func addTopic(topic: TopicDao) {
//        topics.append(topic)
//    }
//
//    /// Add new Topic Dao
//    ///
//    /// - Returns: Return Topics which save by user
//    static func getAllTopics() -> [TopicDao] {
//        return topics
//    }
    
    /// Add new Topic to CoreData
    ///
    /// - Parameter topic: topic
    static func createTopic(_ topic: String) {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageObject = appdelegate.persistentContainer.viewContext
        
        let topicEntity:NSEntityDescription!  = NSEntityDescription.entity(forEntityName: "TopicEntity", in: manageObject)
        let topicObject = NSManagedObject(entity: topicEntity, insertInto: manageObject)
        topicObject.setValue(UUID().uuidString, forKeyPath: "id")
        topicObject.setValue(topic, forKeyPath: "topic")

        do {
            try manageObject.save()
        } catch let error as NSError {
            
            print("Could not save.\(error)")
        }
    }
    
    /// Get all topic from CoreData
    ///
    /// - Parameter topic: topic
    static func retrieveTopic() ->[NSManagedObject]{
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        
        let manageObject = appdelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TopicEntity")
        do {
            let result = try manageObject.fetch(fetchRequest)
            return result as![NSManagedObject]
        } catch{
            print("failed")
        }
        
        return []
    }
    
    
    /// Sorted topic with vote
    static func getSortedTopicEntity() -> [NSManagedObject]{
        let object = retrieveTopic()
        return object.sorted(by: { $0.value(forKey: "vote") as! Int > $1.value(forKey: "vote") as! Int})
    }
    
    /// Update Topic
    ///
    /// - Parameter id: id of topic
    /// - Parameter vote: vote count
    static func updateVote(id: String, vote: Int) {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageObject = appdelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TopicEntity")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        
        do {
            let results = try manageObject.fetch(fetchRequest) as? [NSManagedObject]
            if results?.count != 0 {
                results?[0].setValue(vote, forKeyPath: "vote")
            }
        } catch {
            print("Fetch Failed: \(error)")
        }
        
        do {
            try manageObject.save()
        }
        catch {
            print("Saving Core Data Failed: \(error)")
        }
    }
}
