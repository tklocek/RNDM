//
//  EditToughtVC.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-03-05.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit
import Firebase


class EditThoughtVC: UIViewController, UITextViewDelegate {

    // Outlets
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var thoughtTxt: UITextView!
    @IBOutlet weak var updateBtn: UIButton!
    
    //Variables
    var thought : Thought!
    var selectedCategory = "funny"
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateBtn.layer.cornerRadius = 10
        thoughtTxt.layer.cornerRadius = 10
        thoughtTxt.textColor = UIColor.lightGray

        thoughtTxt.text = thought.thoughtTxt
        selectedCategory = thought.category
        
        
        switch thought.category {
        case ThoughtCategory.funny.rawValue:
            segmentControl.selectedSegmentIndex = 0
        case ThoughtCategory.serious.rawValue:
            segmentControl.selectedSegmentIndex = 1
        default:
            segmentControl.selectedSegmentIndex = 2
        
        }
        
    }
    
    @IBAction func categoryChanged(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            selectedCategory = ThoughtCategory.funny.rawValue
        case 1:
            selectedCategory = ThoughtCategory.serious.rawValue
        default:
            selectedCategory = ThoughtCategory.crazy.rawValue
        }
    
    }
    
    
    @IBAction func updateBtnPressed(_ sender: Any) {
    
        Firestore.firestore().collection(THOUGHTS_REF).document(thought.documentId).updateData([
            CATEGORY : selectedCategory,
            NUM_COMMENTS : thought.numComments ?? 0,
            NUM_LIKES : thought.numLikes ?? 0,
            THOUGHT_TXT : thoughtTxt.text ?? "",
            TIMESTAMP : FieldValue.serverTimestamp(),
            USERNAME : Auth.auth().currentUser?.displayName ?? "",
            USER_ID : Auth.auth().currentUser?.uid ?? ""
        ]) { (error) in
            if let error = error {
                debugPrint("Error updating document: \(error)")
            } else {
                print("update complete")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if thoughtTxt.text == "My random thought ..." {
            thoughtTxt.text = ""
            thoughtTxt.textColor = UIColor.darkGray
        }
    }
    
    
}
