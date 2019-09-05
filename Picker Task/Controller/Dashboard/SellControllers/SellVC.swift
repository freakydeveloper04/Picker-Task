//
//  SellVC.swift
//  Picker Task
//
//  Created by Vaibhav Mehta on 29/08/19.
//  Copyright © 2019 Vaibhav Mehta. All rights reserved.
//

import UIKit
import Firebase

class SellVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var aboutTxt: UITextField!
    @IBOutlet weak var priceTxt: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    var ref = DatabaseReference.init()

    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTxt.delegate = self
        aboutTxt.delegate = self
        priceTxt.delegate = self
        self.ref = Database.database().reference()
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(SellVC.openGallery(tapGesture:)))
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(tapGesture)        
    }
   
    @objc func openGallery(tapGesture: UITapGestureRecognizer){
        
        print("hello")
        self.setupImagePicker()
    }
    
    func saveFIRData(){
        
        self.uploadImage(self.imgView.image!){ url in
            self.saveImage(name: self.nameTxt.text!, about: self.aboutTxt.text!, price: self.priceTxt.text!, profileURL: url!){ success in
                if success != nil{
                    print("Yeah")
                }
            }
        }
    }
    
    @IBAction func uploadBtn(_ sender: UIButton) {
    
        self.saveFIRData()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}

extension SellVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func setupImagePicker(){
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.delegate = self
            imagePicker.isEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imgView.image = image
        self.dismiss(animated: true, completion: nil)
        
    }



    func uploadImage(_ image:UIImage, completion: @escaping ((_ url: URL?) -> ())){
        let storageRef = Storage.storage().reference().child("myImage.png")
        let imgData = imgView.image?.pngData()
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storageRef.putData(imgData!, metadata: metaData){ (metaData, error) in
            
            if error == nil{
                
                print("Success")
                storageRef.downloadURL(completion: {(url, error) in
                    
                    completion(url!)
                })
                
                let alert = UIAlertController(title: "Upload", message: "Uploaded Successfully!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "DONE", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            else{
                
                print("error in save image")
                completion(nil)
            }
        }
    }
    
    func saveImage(name: String, about: String, price: String, profileURL: URL, completion: @escaping ((_ url: URL?) -> ())){
        
        
        let dict = ["name": nameTxt.text!, "about": aboutTxt.text!, "price": priceTxt.text!, "profileURL": profileURL.absoluteString] as [String: Any]
        
        self.ref.child("sell").childByAutoId().setValue(dict)
        
    }
    
}
