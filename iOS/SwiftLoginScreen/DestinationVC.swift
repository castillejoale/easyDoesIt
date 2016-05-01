//
//  DestinationVC.swift
//  SwiftLoginScreen
//
//  Created by Alejandro Castillejo on 5/1/16.
//  Copyright © 2016 Dipin Krishna. All rights reserved.
//

import UIKit
import Foundation

class DestinationVC: UIViewController, UITextViewDelegate {

    @IBOutlet var destinationTextView: UITextView!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var destinationTextViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LocationVC.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LocationVC.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        self.destinationTextView.delegate = self
        self.destinationTextView.returnKeyType = UIReturnKeyType.Done
        
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
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.destinationTextViewBottomConstraint.constant += keyboardSize.height - self.nextButton.frame.size.height
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            
            self.destinationTextViewBottomConstraint.constant -= keyboardSize.height - self.nextButton.frame.size.height
            
        }
        
    }
    
}