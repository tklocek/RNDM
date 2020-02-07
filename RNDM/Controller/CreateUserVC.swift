//
//  CreateUserVC.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-02-05.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit
import Firebase

class CreateUserVC: UIViewController {

    //Outlets
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var createUserBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createUserBtn.layer.cornerRadius = 10
        cancelBtn.layer.cornerRadius = 10
        
        
    }
    

    @IBAction func createUserBtnTapped(_ sender: Any) {
        
        guard let email = emailTxt.text,
            let password = passwordTxt.text,
            let username = usernameTxt.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                debugPrint("Error creating user \(error.localizedDescription)")
            }
            
            let changeRequest = user?.user.createProfileChangeRequest()
            changeRequest?.displayName = username
            changeRequest?.commitChanges(completion: { (error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                }
            })
            
            guard let userId = user?.user.uid else { return }
            Firestore.firestore().collection(USERS_REF).document(userId).setData([
                USERNAME : username,
                DATE_CREATED : FieldValue.serverTimestamp()
                ]
            ) { (error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        
        }
        
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
