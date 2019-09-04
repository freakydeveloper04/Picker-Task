//
//  BuyVC.swift
//  Picker Task
//
//  Created by Vaibhav Mehta on 29/08/19.
//  Copyright © 2019 Vaibhav Mehta. All rights reserved.
//

import UIKit
import Firebase

class BuyVC: UIViewController {

    var arrData = [ProductModel]()
    var ref = DatabaseReference.init()

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getAllFIRData()
    }
    
    func getAllFIRData(){
        self.ref.child("sell").queryOrderedByKey().observe(.value){ (snapshot) in
            
            self.arrData.removeAll()
            if let snapShot = snapshot.children.allObjects as? [DataSnapshot]{
                
                for snap in snapShot{
                    
                    if let mainDict = snap.value as? [String: AnyObject]{
                        let name = mainDict["name"] as? String
                        let about = mainDict["about"] as? String
                        let price = mainDict["price"] as? String
                        let imgView = mainDict["imgView"] as? String ?? ""
                        
                        self.arrData.append(ProductModel(name: name!, about: about!, price: price!, imgView: imgView))
                        
                        self.tableView.reloadData()
                    }
                    
                }
            }
        }
    }
    
    @IBAction func sellProduct(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vcc = story.instantiateViewController(withIdentifier: "sell")
        vcc.modalPresentationStyle = .overCurrentContext
        self.present(vcc, animated: true, completion: nil)
    }
    
}

extension BuyVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductList", for: indexPath) as! ProductList
        cell.productModel = arrData[indexPath.row]
        return cell
    }
}
