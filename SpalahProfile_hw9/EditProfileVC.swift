//
//  EditProfileVC.swift
//  SpalahProfile_hw9
//
//  Created by Sergey Gaponov on 10/29/17.
//  Copyright © 2017 Sergey Gaponov. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surNameTextField: UITextField!
    @IBOutlet weak var ageStatusSwitch: UISwitch!
    
    
    //    TODO:  -- Possible??? sdfasdfas
    @IBOutlet weak var greetingLabel: UILabel!
    
//        {
//        get {
//            self.greetingLabel.text = ""
//            return self.greetingLabel
//        }
//    }
    
    
    var delegate: EditprofileDelegate?
    
    var userName = "Undefined"
    var userSurName = "Undefined"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = userName
        surNameTextField.text = userSurName
        
        setTextBySwitchStatus(ageStatusSwitch)
    }
    
    
    @IBAction func actionGreetingSwitch(_ sender: UISwitch) {
        
    }
    
    @IBAction func actionConfirmButton(_ sender: UIButton) {
        
        userName = nameTextField.text ?? "nil"
        userSurName = surNameTextField.text ?? "nil"
        
        setTextBySwitchStatus(ageStatusSwitch)
        
        nameTextField.resignFirstResponder()
        surNameTextField.resignFirstResponder()
        
        guard let _ = delegate?.userDidChange(firstName: userName, lastName: userSurName) else {
            return
        }
    }
    
    @IBAction func actionResetButton(_ sender: UIButton) {
        
        let emptyString = ""
        userName = emptyString
        userSurName = emptyString
        nameTextField.text = emptyString
        surNameTextField.text = emptyString
        greetingLabel.text = emptyString
        
        nameTextField.resignFirstResponder()
        surNameTextField.resignFirstResponder()
        
        guard let _ = delegate?.userDidResetInfo() else {
            return
        }
    }
    
    @IBAction func actionAgeStatus(_ sender: UISwitch) {
        
       setTextBySwitchStatus(sender)
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == nameTextField {
            surNameTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
         return true
    }
    
     // MARK: - Self methods
    
    func setTextBySwitchStatus(_ switchButton: UISwitch) {
        
        if userName != "" {
            greetingLabel.text = switchButton.isOn ?
                "Здравствуйте, \(userName) \(userSurName)" :
            "Привет,  \(userName)"
        }
    }

}
