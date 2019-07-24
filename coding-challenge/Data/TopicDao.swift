//
//  TopicDao.swift
//  coding-challenge
//
//  Created by Law Chin Yeow on 24/07/2019.
//  Copyright © 2019 Law Chin yeow. All rights reserved.
//

import Foundation

class TopicDao {
    private var topic:String
    private var upvoteCount:Int!
    private var downvoteCount:Int!
    
    init(_ topic: String) {
        self.topic = topic
        upvoteCount = 0
        downvoteCount = 0
    }
    
    /// Update upvote count by 1
    func upvote() {
        upvoteCount += 1
    }
    
    /// Update downvote count by 1
    func downvote() {
        downvoteCount += 1
    }
    
    /// Get topic
    ///
    /// - Returns: topic in String
    func getTopic() -> String {
        return topic
    }
    
    /// Get upvoteCount
    ///
    /// - Returns: upvoteCount in Int
    func getUpvotesCount() -> Int {
        return upvoteCount
    }
    
    /// Get downvoteCount
    ///
    /// - Returns: downvoteCount in Int
    func getDownvotesCount() -> Int {
        return downvoteCount
    }
    
    /// Get vote count by minus downvotecount from upvotecount
    ///
    /// - Returns: vote count in Int
    func getVoteCount() -> Int {
        return upvoteCount - downvoteCount
    }
}
