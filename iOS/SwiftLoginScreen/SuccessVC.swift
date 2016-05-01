//
//  SuccessVC.swift
//  SwiftLoginScreen
//
//  Created by Alejandro Castillejo on 5/1/16.
//  Copyright © 2016 Dipin Krishna. All rights reserved.
//

import UIKit
import Foundation

class SuccessVC: UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func donePressed(sender: AnyObject) {
        
        //Dismiss modal
        self.dismissViewControllerAnimated(true, completion: {});
        
        //Go to root view controller
        if let nav = UIApplication.sharedApplication().keyWindow?.rootViewController as? UINavigationController {
            nav.popToViewController(nav.viewControllers[0] as UIViewController, animated: false)
        }
        
        
    }
    
}