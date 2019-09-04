//
//  ProductModel.swift
//  Picker Task
//
//  Created by Vaibhav Mehta on 04/09/19.
//  Copyright © 2019 Vaibhav Mehta. All rights reserved.
//

import Foundation
import UIKit

class ProductModel{
    
    var name: String?
    var about: String?
    var price: String?
    var imgView: String?
    
    init(name: String, about: String, price: String, imgView: String) {
        self.name = name
        self.about = about
        self.price = price
        self.imgView = imgView
    }
}
