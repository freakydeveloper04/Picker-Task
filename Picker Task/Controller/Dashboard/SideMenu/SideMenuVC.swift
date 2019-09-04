//
//  SideMenuVC.swift
//  Picker Task
//
//  Created by Vaibhav Mehta on 30/08/19.
//  Copyright © 2019 Vaibhav Mehta. All rights reserved.
//

import UIKit

class SideMenuVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    
        print(indexPath.row)
        
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        
        switch indexPath.row {
            
        case 0:NotificationCenter.default.post(name: NSNotification.Name("ShowAccount"), object: nil)

        case 1:NotificationCenter.default.post(name: NSNotification.Name("ShowProfile"), object: nil)
            
        case 2:NotificationCenter.default.post(name: NSNotification.Name("ShowLocation"), object: nil)
            
        case 3:NotificationCenter.default.post(name: NSNotification.Name("ShowMail"), object: nil)
            
        case 4:NotificationCenter.default.post(name: NSNotification.Name("ShowLogout"), object: nil)
            
        default: break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
   
}
