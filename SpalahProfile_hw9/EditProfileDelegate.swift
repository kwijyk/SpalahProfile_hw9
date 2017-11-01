//
//  EditProfileDelegate.swift
//  SpalahProfile_hw9
//
//  Created by Sergey Gaponov on 10/29/17.
//  Copyright © 2017 Sergey Gaponov. All rights reserved.
//

import Foundation

protocol EditprofileDelegate {
    
    func  userDidChange(firstName:  String, lastName:  String)
    func  userDidResetInfo()
}
