//
//  RegisterViewController.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 30/11/23.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func registerOnClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("Error occured.")
            } else {
                // Go to home screen
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
    }
    
}
