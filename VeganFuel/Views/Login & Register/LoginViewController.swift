//
//  LoginViewController.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 30/11/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginOnClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                let errorAlert = UIAlertController(title: "Invalid Credentials", message: "Either your password doesn't match, or you don't have an account with this email.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default)
                errorAlert.addAction(okAction)
                self.present(errorAlert, animated: true)
            } else {
                // Go to home screen
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
    }
    
}
