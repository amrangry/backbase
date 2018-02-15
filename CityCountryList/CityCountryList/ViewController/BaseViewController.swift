//
//  BaseViewController.swift
//  CityCountryList
//
//  Created by Amr ELghadban on 2/14/18.
//  Copyright © 2018 Amr ELghadban. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    let activityIndicatorOverlayViewTag = 99999999
    let activityIndicatorViewTag = 89999999
    
    func showActivityIndicator(view: UIView, withOpaqueOverlay: Bool) {

        var superView: UIView = view

        if withOpaqueOverlay {
            let overlay = UIView()
            overlay.frame =  CGRect.init(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height)
            overlay.layer.backgroundColor = UIColor.init(red: 48/255, green: 47/255, blue: 44/255, alpha: 1.0).cgColor
            overlay.alpha = 0.3
            overlay.tag = activityIndicatorOverlayViewTag
            overlay.center = superView.center
            overlay.isHidden = false
            superView.addSubview(overlay)
            superView.bringSubview(toFront: overlay)
            superView = overlay
        }
        
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        indicator.color = UIColor.red
        indicator.center = superView.center
        indicator.tag = activityIndicatorViewTag
        indicator.isHidden = false
        superView.addSubview(indicator)
        superView.bringSubview(toFront: indicator)
        indicator.startAnimating()
    }
    
    func hideActivityIndicator(view: UIView) {
        view.viewWithTag(activityIndicatorViewTag)?.removeFromSuperview()
        view.viewWithTag(activityIndicatorOverlayViewTag)?.removeFromSuperview()
    }
}



