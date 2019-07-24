//
//  TableViewCellTopic.swift
//  coding-challenge
//
//  Created by Law Chin Yeow on 24/07/2019.
//  Copyright © 2019 Law Chin yeow. All rights reserved.
//

import UIKit

class TableViewCellTopic: UITableViewCell {
    
    private var topicDao:TopicDao!
    @IBOutlet weak var textTopic: UITextView!
    @IBOutlet weak var txtVote: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// This function use to set TopicData object and set the label
    ///
    /// - Parameter topicObj: The TopicDao from AppData
    func setTopicDao(_ topicObj: TopicDao) {
        topicDao = topicObj
        textTopic.text = topicDao.getTopic()
        updateVote()
    }
    
    @IBAction func upvote(_ sender: Any) {
        topicDao.upvote()
        updateVote()
    }
    
    @IBAction func downvote(_ sender: Any) {
        topicDao.downvote()
        updateVote()
    }
    
    /// This function use to update vote count on TableCell
    ///
    /// - Note: The count will become '.' if vote count is less than 1
    func updateVote() {
        guard let obj = topicDao else {
            return
        }
        
        let vote = obj.getVoteCount()
        if vote <= 0 {
            txtVote.text = "."
        } else {
            txtVote.text = "\(vote)"
        }
    }
}
