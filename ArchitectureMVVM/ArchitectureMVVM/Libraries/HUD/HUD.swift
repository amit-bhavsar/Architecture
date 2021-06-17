//
//  HUD.swift
//  AMIT
//
//  Created by MAC-209 on 9/15/16.
//  Copyright © 2016 MAC-209. All rights reserved.
//

import UIKit

class HUD : UIView
{
    static private var backGroundView : UIView?
    static var progressTintColor = UIColor.black
    
    class func show()
    {
        HUD.hide()
        DispatchQueue.main.async
        {
            let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
            backGroundView = UIView(frame: sceneDelegate.window!.bounds)
            backGroundView!.backgroundColor = UIColor.black.withAlphaComponent(0.3)

            let indicatorView = IndicatorView(progressIndicatorColor : HUD.progressTintColor)
            backGroundView!.addSubview(indicatorView)
            indicatorView.center = (backGroundView?.center)!
            
            sceneDelegate.window!.addSubview(backGroundView!)
        
        }
    }
    
    
    class func hide()
    {
        DispatchQueue.main.async
        {
            backGroundView?.removeFromSuperview()
        }
    }
}


class IndicatorView : UIView
{
    var progressIndicatorColor : UIColor!
    
    override init(frame : CGRect)
    {
        super.init(frame : frame)
    }
    
    
    init(progressIndicatorColor : UIColor)
    {
        super.init(frame : CGRect(x : 0, y : 0, width : 40.0, height : 40.0))
        self.progressIndicatorColor = progressIndicatorColor
        
        self.initIndicatorView()
    }
    
    
    required init?(coder aDecoder : NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initIndicatorView()
    {
        let activityIndicator = UIActivityIndicatorView(style : UIActivityIndicatorView.Style.large)
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = false
        activityIndicator.color = progressIndicatorColor
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        let xConstraint = NSLayoutConstraint(item : activityIndicator, attribute : .centerX, relatedBy : .equal, toItem : self, attribute : .centerX, multiplier : 1, constant : 0)

        let yConstraint = NSLayoutConstraint(item : activityIndicator, attribute : .centerY, relatedBy : .equal, toItem : self, attribute : .centerY, multiplier : 1, constant : 0)
        NSLayoutConstraint.activate([xConstraint, yConstraint])
    }
}
