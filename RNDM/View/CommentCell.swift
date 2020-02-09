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
    @IBOutlet weak var timestampLbl: NSLayoutConstraint!
    @IBOutlet weak var commentLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
