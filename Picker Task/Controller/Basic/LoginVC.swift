//
//  LoginVC.swift
//  Picker Task
//
//  Created by Vaibhav Mehta on 29/08/19.
//  Copyright © 2019 Vaibhav Mehta. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var headLbl: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var enterTextLbl: UILabel!
    @IBOutlet weak var entrLbl: UILabel!
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var enterTxt: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTxt.delegate = self
        passwordTxt.delegate = self
        enterTxt.delegate = self

        
        let number = Int.random(in: 1000 ..< 9999)
        print("number", number)
        
        enterTextLbl.text = "\(number)"

    }

    @IBAction func loginBtn(_ sender: UIButton) {
        
        guard let email = usernameTxt.text else { return }
        guard let password = passwordTxt.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                
                
                self.dismiss(animated: false, completion: nil)
                    let story = UIStoryboard(name: "Main", bundle: nil)
                    let vcc = story.instantiateViewController(withIdentifier: "welcome")
                    vcc.modalPresentationStyle = .overCurrentContext
                    self.present(vcc, animated: true, completion: nil)
                    
            } else {
                    let alert = UIAlertController(title: "Alert", message: "Error logging in: \(error!.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
            }
            
        
        }
    }
        
    @IBAction func forgotPassBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func signupBtn(_ sender: UIButton) {
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vcc = story.instantiateViewController(withIdentifier: "signup")
        vcc.modalPresentationStyle = .overCurrentContext
        self.present(vcc, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
