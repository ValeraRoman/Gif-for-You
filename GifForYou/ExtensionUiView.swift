//
//  ExtensionUiView.swift
//  GifForYou
//
//  Created by Macbook Air 13 on 05.02.2021.
//

import UIKit


extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor? , right: NSLayoutXAxisAnchor?, paddingTop: CGFloat , paddingLeft: CGFloat , paddingBotton: CGFloat, paddingRight: CGFloat ){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingLeft).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        
        var safeTopAnchor: NSLayoutYAxisAnchor{
            if #available(iOS 11.0, *){
                return safeAreaLayoutGuide.topAnchor
            }
            return topAnchor
        }
        
        var safeLeftAnchor: NSLayoutXAxisAnchor{
            if #available(iOS 11.0, *){
                return safeAreaLayoutGuide.leftAnchor
            }
            return leftAnchor
        }
        
        var safeRightAnchor: NSLayoutXAxisAnchor{
            if #available(iOS 11.0, *){
                return safeAreaLayoutGuide.rightAnchor
            }
            return rightAnchor
        }
        var safeBottomAnchor: NSLayoutYAxisAnchor{
            if #available(iOS 11.0, *){
                return safeAreaLayoutGuide.bottomAnchor
            }
            return bottomAnchor
        }
        
    }
    
    
    
}
