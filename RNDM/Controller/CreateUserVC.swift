//
//  CreateUserVC.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-02-05.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit

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
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
    }
    
}
