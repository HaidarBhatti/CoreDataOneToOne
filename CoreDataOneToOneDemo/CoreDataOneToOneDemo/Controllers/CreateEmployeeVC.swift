//
//  CreateEmployeeVC.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 24/02/2023.
//

import UIKit

class CreateEmployeeVC: UIViewController {

    @IBOutlet weak var imgEmployee: UIImageView!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassportNo: UITextField!
    @IBOutlet weak var textPassportPlaceOfIssue: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnClearAll: UIButton!
    
    private let manager = EmployeeManager()
    var imagePicker = UIImagePickerController()
    
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let employee = self.employee{
            self.imgEmployee.image = UIImage(data: employee.profilePic)
            self.textName.text = employee.name
            self.textEmail.text = employee.email
            self.textPassportNo.text = employee.passport?.passportId
            self.textPassportPlaceOfIssue.text = employee.passport?.placeOfIssue
            
            self.btnSave.setTitle("Update", for: .normal)
            self.btnClearAll.setTitle("Delete", for: .normal)
        }
        
//        if let result = manager.getEmployees(){
//            result.forEach { employee in
//                manager.deleteEmployee(id: employee.id)
//            }
//        }
        
        print("Documents Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first ?? "Not Found!")

        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgEmployee.isUserInteractionEnabled = true
        imgEmployee.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func onTapSave(_ sender: UIButton) {
        if sender.titleLabel?.text == "Update"{
            if let employee = employee {
                let passport = Passport(id: employee.passport!.id,
                                        passportId: textPassportNo.text,
                                        placeOfIssue: textPassportPlaceOfIssue.text)
                if manager.updateEmployee(employee: Employee(id: employee.id, email: textEmail.text!, name: textName.text!, profilePic: (imgEmployee.image?.pngData())!, passport: passport)){
                    print("updated successfully")
                    navigationController?.popViewController(animated: true)
                }
                else{
                    print("failed")
                }
            }
        }
        else{//save
            let passport = Passport(id: UUID(),
                                    passportId: textPassportNo.text,
                                    placeOfIssue: textPassportPlaceOfIssue.text)
            
            let image = (imgEmployee.image?.pngData())!
            let employee = Employee(id: UUID(),
                                    email: textEmail.text!,
                                    name: textName.text!,
                                    profilePic: image,
                                    passport: passport)
            
            manager.createEmployee(employee: employee)
            clearAll()
        }
    }
    
    @IBAction func onTapDeleteAll(_ sender: UIButton) {
        if sender.titleLabel?.text == "Delete"{
            if let employee = employee {
                manager.deleteEmployee(id: employee.id)
                navigationController?.popViewController(animated: true)
            }
        }
        else{//clearAll
            clearAll()
        }
    }
    
    func clearAll(){
        textName.text?.removeAll()
        textEmail.text?.removeAll()
        textPassportPlaceOfIssue.text?.removeAll()
        textPassportNo.text?.removeAll()
        imgEmployee.image = UIImage(systemName: "person.fill")
    }
    
}

extension CreateEmployeeVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        imgEmployee.image = image
    }
}
