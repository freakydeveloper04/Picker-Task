//
//  ProductList.swift
//  Picker Task
//
//  Created by Vaibhav Mehta on 04/09/19.
//  Copyright © 2019 Vaibhav Mehta. All rights reserved.
//

import UIKit
import Kingfisher

class ProductList: UITableViewCell {

    @IBOutlet weak var imgViewP: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAbout: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var productModel: ProductModel?{
    
        didSet{
            
            lblName.text = productModel?.name
            lblAbout.text = productModel?.about
            lblPrice.text = productModel?.price
            
            let url = URL(string: (productModel?.imgView)!)
            if let url = url {
                
                KingfisherManager.shared.retrieveImage(with: url as Resource,options: nil, progressBlock: nil){ (image, error, cache, imageURL) in
                
                self.imgViewP.image = image
                self.imgViewP.kf.indicatorType = .activity
                }
            }
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
