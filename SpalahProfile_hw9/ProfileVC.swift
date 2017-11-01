//
//  ProfileVC.swift
//  SpalahProfile_hw9
//
//  Created by Sergey Gaponov on 10/29/17.
//  Copyright © 2017 Sergey Gaponov. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var actualName: UILabel!
    @IBOutlet weak var actualSurname: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Профиль"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "showEditProfileVC",
            let editVC = segue.destination as? EditProfileVC {
            editVC.delegate = self
            editVC.userName = actualName.text!
            editVC.userSurName = actualSurname.text!
        }
    }
 

}

extension ProfileVC: EditprofileDelegate {
    
    func userDidChange(firstName: String, lastName: String) {
        
        actualName.text = firstName
        actualSurname.text = lastName
    }
    
    func userDidResetInfo() {
        actualName.text = ""
        actualName.text = ""
    }
}
