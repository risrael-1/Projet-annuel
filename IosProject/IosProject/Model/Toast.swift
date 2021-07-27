//
//  Toast.swift
//  IosProject
//
//  Created by Eduard Serban on 27/07/2021.
//

import UIKit
import Toast_Swift

class Toast {
    static func makeSuccessToast(text: String, view: UIView) -> Void {
        // create a new style
        var style = ToastStyle()

        // this is just one of many style options
        style.messageColor = .black
        style.backgroundColor = .green
            //UIColor(red: 17/255, green: 57/255, blue: 69/255, alpha: 1.0) // blue background

        // present the toast with the new style
        view.makeToast(text, duration: 3.0, position: .bottom, style: style)
    }
    
    static func makeErrorToast(text: String, view: UIView) -> Void {
        // create a new style
        var style = ToastStyle()

        // this is just one of many style options
        style.messageColor = .white
        style.backgroundColor = .red
            //UIColor(red: 17/255, green: 57/255, blue: 69/255, alpha: 1.0) // blue background

        // present the toast with the new style
        view.makeToast(text, duration: 3.0, position: .bottom, style: style)
    }
}
