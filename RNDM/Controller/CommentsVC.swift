//
//  CommentsVC.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-02-08.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit

class CommentsVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addCommentTxt: UITextField!
    @IBOutlet weak var keyboardView: UIView!
    
    
    
    var thought: Thought!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addCommentTapped(_ sender: Any) {
    }
    
    
}
