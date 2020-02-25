//
//  ThoughtCell.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-02-04.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit
import Firebase

class ThoughtCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!
    @IBOutlet weak var thoughtTxtLbl: UILabel!
    @IBOutlet weak var likesImg: UIImageView!
    @IBOutlet weak var likesNumLbl: UILabel!
    @IBOutlet weak var commentsNumLbl: UILabel!
    @IBOutlet weak var optionsMenu: UIImageView!
    
    //Variables
    private var thought: Thought!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        likesImg.addGestureRecognizer(tap)
        likesImg.isUserInteractionEnabled = true
    }

    @objc func likeTapped() {
        
       //Method 1
//        Firestore.firestore().collection(THOUGHTS_REF)
//            .document(thought.documentId)
//            .setData([NUM_LIKES : thought.numLikes + 1], merge: true)
    
        //Method 2
        Firestore.firestore().document("thoughts/\(thought.documentId!)")
        .updateData([NUM_LIKES : thought.numLikes + 1])
        
        
    }

    func configureCell(thought: Thought) {
        self.thought = thought
        usernameLbl.text = thought.username
        thoughtTxtLbl.text = thought.thoughtTxt
        likesNumLbl.text = String(thought.numLikes)
        commentsNumLbl.text = String(thought.numComments)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, HH:mm"
        let timestamp = formatter.string(from: thought.timestamp)
        timestampLbl.text = timestamp
        
    }
    

}
