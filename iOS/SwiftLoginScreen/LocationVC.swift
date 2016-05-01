//
//  LocationVC.swift
//  SwiftLoginScreen
//
//  Created by Alejandro Castillejo on 5/1/16.
//  Copyright © 2016 Dipin Krishna. All rights reserved.
//

import UIKit
import Foundation

class LocationVC: UIViewController {
    
    @IBOutlet var locationTextView: UITextView!
    var services : NSMutableArray = []
    var service : String?
    
    override func viewDidLoad() {
        
        print("Location")
        print(service)
        print(services)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if "confirmationSegue" == segue.identifier {
            
            let dvc = segue.destinationViewController as! ConfirmationVC
            dvc.services = self.services
            if((self.locationTextView.text) != nil){
                dvc.currentLocation = self.locationTextView.text
            }
            
            dvc.service = self.service
        }
    }
    
}