//
//  ThoughtCell.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-02-04.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit

class ThoughtCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!
    @IBOutlet weak var thoughtTxtLbl: UILabel!
    @IBOutlet weak var likesImg: UIImageView!
    @IBOutlet weak var likesNumLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(thought: Thought) {
        usernameLbl.text = thought.username
        //timestampLbl.text = thought.timestamp
        thoughtTxtLbl.text = thought.thoughtTxt
        likesNumLbl.text = String(thought.numLikes)
        
        
        
    }
    

}
