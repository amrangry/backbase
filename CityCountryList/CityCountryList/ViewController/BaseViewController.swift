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
    
    
    // MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
    // MARK: - Helper Methods
    func showActivityIndicator(view: UIView, withOpaqueOverlay: Bool) {
        // this will be the alignment view for the activity indicator
        var superView: UIView = view
        
      
        
        // if we want an opaque overlay, do that work first then put the activity indicator within that view; else just use the passed UIView to center it
        if withOpaqueOverlay {
            let overlay = UIView()
            overlay.frame =  CGRect.init(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height)
            overlay.layer.backgroundColor = UIColor.init(red: 48/255, green: 47/255, blue: 44/255, alpha: 1.0).cgColor //UIColor.black.cgColor
            overlay.alpha = 0.3
            overlay.tag = activityIndicatorOverlayViewTag
            
            overlay.center = superView.center
            overlay.isHidden = false
            superView.addSubview(overlay)
            superView.bringSubview(toFront: overlay)
            
            // now we'll work on adding the indicator to the overlay (now superView)
            superView = overlay
        }
        
        
        
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        indicator.color = UIColor.red//UIColor.init(red: 48/255, green: 47/255, blue: 44/255, alpha: 1.0)
        indicator.center = superView.center
        indicator.tag = activityIndicatorViewTag
        indicator.isHidden = false
        
        superView.addSubview(indicator)
        superView.bringSubview(toFront: indicator)
        
        indicator.startAnimating()
        
    }
    
    
    
    func hideActivityIndicator(view: UIView) {

        // remove the activity indicator and optional overlay views
        view.viewWithTag(activityIndicatorViewTag)?.removeFromSuperview()
        view.viewWithTag(activityIndicatorOverlayViewTag)?.removeFromSuperview()
        
    }
    
    
}



