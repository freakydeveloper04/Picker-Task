//
//  MainMenuVC.swift
//  Picker Task
//
//  Created by Vaibhav Mehta on 02/09/19.
//  Copyright © 2019 Vaibhav Mehta. All rights reserved.
//

import UIKit
import Firebase

class MainMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil{
            
            self.performSegue(withIdentifier: "toMainView", sender: self)
        }
    }
}
