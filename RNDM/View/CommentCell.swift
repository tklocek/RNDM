//
//  CommentCell.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-02-09.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit
import Firebase

protocol CommentDelegate {
    func commentOptionsTapped(comment: Comment)
}

class CommentCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!
    @IBOutlet weak var optionsMenu: UIImageView!
    
    //variables
    private var comment: Comment!
    private var delegate: CommentDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(comment: Comment, delegate: CommentDelegate?) {
        usernameLbl.text = comment.username
        commentLbl.text = comment.commentTxt
        optionsMenu.isHidden = true
        self.delegate = delegate
        self.comment = comment
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, HH:mm"
        let timestamp = formatter.string(from: comment.timestamp)
        timestampLbl.text = timestamp
        
        if comment.userId == Auth.auth().currentUser?.uid {
            optionsMenu.isHidden = false
            optionsMenu.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(commentOptionsTapped))
            optionsMenu.addGestureRecognizer(tap)
        }
        
     }
        
    @objc func commentOptionsTapped() {
        delegate?.commentOptionsTapped(comment: comment)
    }
    
}
