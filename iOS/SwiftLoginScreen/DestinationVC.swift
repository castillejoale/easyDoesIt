//
//  DestinationVC.swift
//  SwiftLoginScreen
//
//  Created by Alejandro Castillejo on 5/1/16.
//  Copyright © 2016 Dipin Krishna. All rights reserved.
//

import UIKit
import Foundation

class DestinationVC: UIViewController {

    @IBOutlet var destinationTextView: UITextView!
    
    override func viewDidLoad() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if "transportationSegue" == segue.identifier {
            
            let dvc = segue.destinationViewController as! LocationVC
            
            //Set fields
            dvc.services = ["Transportation service"]
            
            if((self.destinationTextView.text) != nil){
                dvc.destinationLocation = self.destinationTextView.text
            }
            
            dvc.service = "Transportation"
        }
    }
    
}