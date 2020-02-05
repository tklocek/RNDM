//
//  LoginVC.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-02-05.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //Outlets
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createUserBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginBtn.layer.cornerRadius = 10
        createUserBtn.layer.cornerRadius = 10
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
    }
    
    
    @IBAction func createUserTapped(_ sender: Any) {
    }
    
    
}
