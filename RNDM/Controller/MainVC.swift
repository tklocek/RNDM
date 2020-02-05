//
//  ViewController.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-01-27.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit
import Firebase

enum ThoughtCategory: String {
    case serious = "serious"
    case funny = "funny"
    case crazy = "crazy"
    case popular = "popular"
}


class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
  

    // Outlets
    @IBOutlet private weak var segmentControl: UISegmentedControl!
    @IBOutlet private weak var tableView: UITableView!

    //Variables
    private var thoughts = [Thought]()
    private var thoughtsCollectionRef: CollectionReference!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thoughts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "thoughtCell", for: indexPath) as? ThoughtCell {
            
            cell.configureCell(thought: thoughts[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        thoughtsCollectionRef = Firestore.firestore().collection(THOUGHTS_REF)
    }

    override func viewWillAppear(_ animated: Bool) {
                
        thoughtsCollectionRef.getDocuments { (snapshot, error) in
            if let err = error {
                debugPrint("Error fetching dosc: \(err)")
            } else {
                guard let snap = snapshot else { return }
                self.thoughts.removeAll()
                for document in snap.documents {
                    let data = document.data()
                    let username = data[USERNAME] as? String ?? "Anonymous"
                    let timestamp = data[TIMESTAMP] as? Date ?? Date()
                    let thoughtTxt = data[THOUGHT_TXT] as? String ?? ""
                    let numLikes = data[NUM_LIKES] as? Int ?? 0
                    let numComents = data[NUM_COMMENTS] as? Int ?? 0
                    let documentId = document.documentID
                    
                    let newThought = Thought(username: username, timestamp: timestamp, thoughtTxt: thoughtTxt, numLikes: numLikes, numComments: numComents, documentId: documentId)
                    self.thoughts.append(newThought)
                }
                self.tableView.reloadData()
            }
            
        }
    }
    
}


