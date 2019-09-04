//
//  DashboardVC.swift
//  Picker Task
//
//  Created by Vaibhav Mehta on 29/08/19.
//  Copyright © 2019 Vaibhav Mehta. All rights reserved.
//

import UIKit
import Firebase

class DashboardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(showAccount), name: NSNotification.Name("ShowAccount"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(showProfile), name: NSNotification.Name("ShowProfile"), object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(showLocation), name: NSNotification.Name("ShowLocation"), object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(showMail), name: NSNotification.Name("ShowMail"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(logOut), name: NSNotification.Name("ShowLogout"), object: nil)
    }
    
    @objc func showAccount(){
        
        performSegue(withIdentifier: "ShowAccount", sender: nil)
    }
    @objc func showProfile(){
        
        performSegue(withIdentifier: "ShowProfile", sender: nil)
    }
    @objc func showLocation(){
        
        performSegue(withIdentifier: "ShowLocation", sender: nil)
    }
    @objc func showMail(){
        
        performSegue(withIdentifier: "ShowMail", sender: nil)
    }
    @objc func logOut(){

        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
        
//        let story = UIStoryboard(name: "Main", bundle: nil)
//        let vcc = story.instantiateViewController(withIdentifier: "main")
//        vcc.modalPresentationStyle = .overCurrentContext
//        self.present(vcc, animated: true, completion: nil)

    }
    
    
    @IBAction func onMoreTapped(){
        
        print("TOGGLE SIDE MENU")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)

    }

    
}
