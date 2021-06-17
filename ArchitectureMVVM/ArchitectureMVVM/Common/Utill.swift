//
//  Utill.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 10/06/21.
//

import UIKit

class Utill
{
    class func hideKeyboard()
    {
        let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
        sceneDelegate.window!.endEditing(true)
    }
}
