//
//  SignUpVC.swift
//  Picker Task
//
//  Created by Vaibhav Mehta on 29/08/19.
//  Copyright © 2019 Vaibhav Mehta. All rights reserved.

import UIKit
import Firebase

class SignUpVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var headLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var reenterLbl: UILabel!
    @IBOutlet weak var contactLbl: UILabel!
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var reenterTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    
    @IBOutlet weak var tncSwitch: UISwitch!
    @IBOutlet weak var tncLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTxt.delegate = self
        emailTxt.delegate = self
        passwordTxt.delegate = self
        reenterTxt.delegate = self
        phoneTxt.delegate = self
        
        
    }
    
    @IBAction func signupBtn(_ sender: UIButton) {
        
        guard let email = emailTxt.text else { return }
        guard let password = passwordTxt.text else { return }
        

        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                print("User created!")
              
                let story = UIStoryboard(name: "Main", bundle: nil)
                let vcc = story.instantiateViewController(withIdentifier: "welcome")
                vcc.modalPresentationStyle = .overCurrentContext
                self.present(vcc, animated: true, completion: nil)
                }
                
             else {
                let alert = UIAlertController(title: "Alert", message: "Error: \(error!.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                print("Error: \(error!.localizedDescription)")
            }
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
