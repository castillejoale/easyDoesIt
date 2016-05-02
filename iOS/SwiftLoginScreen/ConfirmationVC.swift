//
//  ConfirmationVC.swift
//  SwiftLoginScreen
//
//  Created by Alejandro Castillejo on 5/1/16.
//  Copyright © 2016 Dipin Krishna. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class ConfirmationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var destinationLocationTitleLabel: UILabel!
    @IBOutlet var destinationLocationLabel: UILabel!
    @IBOutlet var confirmButton: UIButton!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var inputLocationLabel: UILabel!
    var services : NSMutableArray = []
    var currentLocation : String?
    var service : String?
    var destinationLocation : String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("Confirmation")
        print(service)
        print(services)
        print(currentLocation)
        print(destinationLocation)
        
        self.inputLocationLabel.text = currentLocation
        
        //Remove empty cells
        self.tableView.tableFooterView = UIView()
        
        if(!(service == "Transportation")){
            self.destinationLocationLabel.hidden = true
            self.destinationLocationTitleLabel.hidden = true
        } else {
            self.destinationLocationLabel.text = self.destinationLocation
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func confirmPressed(sender: AnyObject) {
        
//        let parameters = [
//            "Type": String(self.service),
//            "Location": String(self.currentLocation),
//            "Motive": String(self.services),
//            "DestinationLocation": String(self.destinationLocation),
//            "Gender": "any",
//            "Name":"Max Fitton",
//            "Broken_item": "nothing"
//        ]
        
//        let parameters = [
//            "Type": "ha",
//            "Location":"ha",
//            "Motive": "ha",
//            "DestinationLocation": "ha",
//            "Gender": "ha",
//            "Name":"Max Fitton",
//            "Broken_item": "ha"
//        ]
//        
//        
//        let urlString = "http://10.142.34.124:5000/service_request"
//        let fileUrl = NSURL(string: urlString)
//
//        
//        Alamofire.request(.POST, fileUrl!, parameters: parameters, encoding: .JSON).responseJSON {response, JSON, result in
//            
//            print(response)
//            print(JSON)
//            print(result.description)
//        
//            switch result {
//            case .Success(let data):
//                print("success")
//            case .Failure(_, let error):
//                print("Request failed with error: \(error)")
//            }
//            
//        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("normalCell")! as UITableViewCell
        
        cell.textLabel?.text = self.services[indexPath.row] as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.services.count;
    }

}