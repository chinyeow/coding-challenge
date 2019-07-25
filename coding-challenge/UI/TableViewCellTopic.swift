//
//  TableViewCellTopic.swift
//  coding-challenge
//
//  Created by Law Chin Yeow on 24/07/2019.
//  Copyright © 2019 Law Chin yeow. All rights reserved.
//

import UIKit
import CoreData

class TableViewCellTopic: UITableViewCell {
    
    private var topicDao:NSManagedObject!
    private var vote:Int!
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
    func setTopicDao(_ topicObj: NSManagedObject) {
        topicDao = topicObj
        textTopic.text = topicDao.value(forKey: "topic") as? String
        vote = topicDao.value(forKey: "vote") as? Int ?? 0
        updateVote()
    }
    
    @IBAction func upvote(_ sender: Any) {
        vote += 1
        updateVote()
    }
    
    @IBAction func downvote(_ sender: Any) {
        vote -= 1
        updateVote()
    }
    
    /// This function use to update vote count on TableCell
    ///
    /// - Note: The count will become '.' if vote count is less than 1
    func updateVote() {
        guard let obj = topicDao else {
            return
        }
        
        AppData.updateVote(id: obj.value(forKey: "id") as! String, vote: vote)
        if vote <= 0 {
            txtVote.text = "."
        } else {
            txtVote.text = "\(String(describing: vote!))"
        }
    }
}
