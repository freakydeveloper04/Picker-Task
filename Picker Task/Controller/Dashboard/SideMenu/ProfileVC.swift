//
//  ProfileVC.swift
//  Picker Task
//
//  Created by Vaibhav Mehta on 29/08/19.
//  Copyright © 2019 Vaibhav Mehta. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var enterpasswordTxt: UITextField!
    @IBOutlet weak var contactTxt: UITextField!
   
    var imagePicker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
    }
    
   
//    @IBAction func profileImgChange(_ sender: Any) {
//
//        self.present(imagePicker, animated: true, completion: nil)
//
//        guard let email = emailTxt.text else { return }
//        guard let password = passwordTxt.text else { return }
//
//        Auth.auth().createUser(withEmail: email, password: password) { user, error in
//            if error == nil && user != nil {
//                print("User created!")
//
//
//
//                // 1. Upload the profile image to Firebase Storage
//
//                self.uploadProfileImage(image) { url in
//
//                    if url != nil {
//                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
//                        changeRequest?.displayName = username
//                        changeRequest?.photoURL = url
//
//                        changeRequest?.commitChanges { error in
//                            if error == nil {
//                                print("User display name changed!")
//
//                                self.saveProfile(username: username, profileImageURL: url!) { success in
//                                    if success {
//                                        self.dismiss(animated: true, completion: nil)
//                                    }
//                                }
//
//                            } else {
//                                print("Error: \(error!.localizedDescription)")
//                            }
//                        }
//                    } else {
//                        // Error unable to upload profile image
//                    }
//
//                }
//
//            } else {
//                print("Error: \(error!.localizedDescription)")
//            }
//        }
//    }
    
//    func uploadProfileImage(_ image:UIImage, completion: @escaping ((_ url:URL?)->())) {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        let storageRef = Storage.storage().reference().child("user/\(uid)")
//
//        let imageData = image.jpegData(compressionQuality: 0.75)
//
//
//        let metaData = StorageMetadata()
//        metaData.contentType = "image/jpg"
//
//        storageRef.putData(imageData!, metadata: metaData) { metaData, error in
//            if error == nil, metaData != nil {
//
//                storageRef.downloadURL { url, error in
//                    completion(url)
//                    // success!
//                }
//            } else {
//                // failed
//                completion(nil)
//            }
//        }
//    }
    

    @IBAction func updateBtn(_ sender: Any) {
    
    }
}

//extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true, completion: nil)
//    }
//
//    internal func imagePickerController(_ picker:  UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        guard (info[.originalImage] as? UIImage) != nil else {
//            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
//        }
//
//        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//            self.profileImg.image = pickedImage
//        }
//
//        picker.dismiss(animated: true, completion: nil)
//    }
//}
