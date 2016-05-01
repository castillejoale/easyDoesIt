//
//  LocationVC.swift
//  SwiftLoginScreen
//
//  Created by Alejandro Castillejo on 5/1/16.
//  Copyright © 2016 Dipin Krishna. All rights reserved.
//

import UIKit
import Foundation

class LocationVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet var locationTextView: UITextView!
    var services : NSMutableArray = []
    var service : String?
    var destinationLocation : String?
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var locationTextViewBottomConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Location")
        print(service)
        print(services)
        print (destinationLocation)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LocationVC.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LocationVC.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        
        self.locationTextView.delegate = self
        self.locationTextView.returnKeyType = UIReturnKeyType.Done
        
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
            
            if((destinationLocation) != nil){
                dvc.destinationLocation = destinationLocation
            }
            
            dvc.service = self.service
        }
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.locationTextViewBottomConstraint.constant += keyboardSize.height - self.nextButton.frame.size.height
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            
            self.locationTextViewBottomConstraint.constant -= keyboardSize.height - self.nextButton.frame.size.height
            
        }
        
    }
    
    
    
    
    
}