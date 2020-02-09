//
//  CommentsVC.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-02-08.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit

class CommentsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    //Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addCommentTxt: UITextField!
    @IBOutlet weak var keyboardView: UIView!
    
    //Variables
    var thought: Thought!
    var comments = [Comment]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    @IBAction func addCommentTapped(_ sender: Any) {
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as? CommentCell {
            cell.configureCell(comment: comments[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    
}
