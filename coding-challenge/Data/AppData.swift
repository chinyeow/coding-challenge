//
//  AppData.swift
//  coding-challenge
//
//  Created by Law Chin Yeow on 24/07/2019.
//  Copyright © 2019 Law Chin yeow. All rights reserved.
//

import Foundation

class AppData {
    private static var topics:[TopicDao] = []
    
    /// Add new Topic Dao
    ///
    /// - Parameter topic: a new object of TopicDao
    static func addTopic(topic: TopicDao) {
        topics.append(topic)
    }
    
    /// Add new Topic Dao
    ///
    /// - Returns: Return Topics which save by user
    static func getAllTopics() -> [TopicDao] {
        return topics
    }
}
