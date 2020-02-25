//
//  CommentCell.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-02-09.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!
    @IBOutlet weak var optionsMenu: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(comment: Comment) {
        usernameLbl.text = comment.username
        commentLbl.text = comment.commentTxt
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, HH:mm"
        let timestamp = formatter.string(from: comment.timestamp)
        timestampLbl.text = timestamp
     }
    
    
}
