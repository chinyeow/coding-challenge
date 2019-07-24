//
//  Test.swift
//  Test
//
//  Created by Law Chin Yeow on 24/07/2019.
//  Copyright © 2019 Law Chin yeow. All rights reserved.
//

import XCTest
@testable import coding_challenge

var topicDao:TopicDao!

class Test: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        topicDao = TopicDao("topic")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testVoteCount() {
        for _ in 1 ... 5 {
            topicDao.upvote()
        }
        for _ in 1 ... 3 {
            topicDao.downvote()
        }
        XCTAssertEqual(topicDao.getUpvotesCount(), 5, "upvote count is wrong")
        XCTAssertEqual(topicDao.getDownvotesCount(), 3, "downvote count is wrong")
        XCTAssertEqual(topicDao.getVoteCount(), 2, "Total vote count is wrong")
    }

}
