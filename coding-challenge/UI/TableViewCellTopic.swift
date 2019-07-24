//
//  TableViewCellTopic.swift
//  coding-challenge
//
//  Created by Law Chin Yeow on 24/07/2019.
//  Copyright © 2019 Law Chin yeow. All rights reserved.
//

import UIKit

class TableViewCellTopic: UITableViewCell {
    
    @IBOutlet weak var btnUpvote: UIImageView!
    @IBOutlet weak var btnDownvote: UIImageView!
    @IBOutlet weak var lblTopic: UITextView!
    @IBOutlet weak var voteCount: UILabel!
    private var topicDao:TopicDao!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
