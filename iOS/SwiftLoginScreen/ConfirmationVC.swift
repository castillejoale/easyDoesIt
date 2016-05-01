//
//  ConfirmationVC.swift
//  SwiftLoginScreen
//
//  Created by Alejandro Castillejo on 5/1/16.
//  Copyright © 2016 Dipin Krishna. All rights reserved.
//

import UIKit
import Foundation

class ConfirmationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var inputLocationLabel: UILabel!
    var services : NSMutableArray = []
    var currentLocation : String?
    var service : String?
    
    override func viewDidLoad() {
        
        print("Confirmation")
        print(service)
        print(services)
        print(currentLocation)
        
        self.inputLocationLabel.text = currentLocation
        
        //Remove empty cells
        self.tableView.tableFooterView = UIView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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