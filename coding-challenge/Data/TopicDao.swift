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
    
    func upvote() {
        upvoteCount += 1
    }
    
    func downvote() {
        downvoteCount += 1
    }
    
    func getTopic() -> String {
        return topic
    }
    
    func getUpvotesCount() -> Int {
        return upvoteCount
    }
    
    func getDownvotesCount() -> Int {
        return downvoteCount
    }
}
