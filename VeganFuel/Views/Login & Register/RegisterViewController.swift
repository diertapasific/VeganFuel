//
//  RegisterViewController.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 30/11/23.
//
import UIKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerOnClicked(_ sender: UIButton) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let fullName = fullNameTextField.text,
              let phoneNumber = phoneNumberTextField.text,
              let address = addressTextField.text else { return }

        Auth.auth().createUser(withEmail: email, password: password) { (firebaseResult, error) in
            if let e = error {
                let errorAlert = UIAlertController(title: "Incomplete Information", message: "Please fill in all the required fields.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default)
                errorAlert.addAction(okAction)
                self.present(errorAlert, animated: true)
            } else {
                // Store to Firebase DB
                let db = Firestore.firestore()
                let userDocRef = db.collection("users").document(email)
                
                let userData: [String: Any] = [
                    "fullName": fullName,
                    "phoneNumber": phoneNumber,
                    "address": address,
                    "email": email
                ]

                userDocRef.setData(userData) { error in
                    if let error = error {
                    
                        print("Error writing document: \(error)")
                        // Handle the error appropriately
                    } else {
                        self.performSegue(withIdentifier: "goToNext", sender: self)
                    }
                }
            }
        }
    }
}
