//
//  AddToughtVC.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-02-01.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit
import Firebase


class AddToughtVC: UIViewController, UITextViewDelegate  {

    //Outlets
    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var thoughtTxt: UITextView!
    @IBOutlet weak var postBtn: UIButton!
    
    //Variables
    private var selectedCategory = ThoughtCategory.funny.rawValue
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postBtn.layer.cornerRadius = 4
        thoughtTxt.layer.cornerRadius = 4
        thoughtTxt.text = "My random thought ..."
        thoughtTxt.textColor = UIColor.lightGray
        thoughtTxt.delegate = self
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if thoughtTxt.text == "My random thought ..." {
            thoughtTxt.text = ""
            thoughtTxt.textColor = UIColor.darkGray
        }
    }
    
    
    @IBAction func categoryChanged(_ sender: Any) {
        switch categorySegment.selectedSegmentIndex {
        case 0:
            selectedCategory = ThoughtCategory.funny.rawValue
        case 1:
            selectedCategory = ThoughtCategory.serious.rawValue
        default:
            selectedCategory = ThoughtCategory.crazy.rawValue
        }
    }
    
    @IBAction func postBtnTapped(_ sender: Any) {
        
        guard let username = userNameTxt.text else { return }
        
        Firestore.firestore().collection("thoughts").addDocument(data: [
            CATEGORY : selectedCategory,
            NUM_COMMENTS : 0,
            NUM_LIKES : 0,
            THOUGHT_TXT : thoughtTxt.text ?? "",
            TIMESTAMP : FieldValue.serverTimestamp(),
            USERNAME : username
        ]) { (err) in
            if let err = err {
                debugPrint("Error adding document: \(err)")
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        
        
    }
    

    
    
}
