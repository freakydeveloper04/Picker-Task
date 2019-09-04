//
//  WelcomeVC.swift
//  Picker Task
//
//  Created by Vaibhav Mehta on 29/08/19.
//  Copyright © 2019 Vaibhav Mehta. All rights reserved.
//

import UIKit
import Firebase

class WelcomeVC: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapBtn(_ sender: UIButton) {
        
    }
    @IBAction func logOut(_ sender: UIButton) {
        
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
}
