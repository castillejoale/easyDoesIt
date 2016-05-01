//
//  AttendanceVC.swift
//  SwiftLoginScreen
//
//  Created by Alejandro Castillejo on 4/30/16.
//  Copyright © 2016 Dipin Krishna. All rights reserved.
//

import Foundation
import UIKit

class AttendanceVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var items: [String] = ["Get out of bed", "Bathroom", "Buy medicines", "Change position"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        //Remove empty cells
        self.tableView.tableFooterView = UIView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:CustomTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("CustomCell")! as! CustomTableViewCell
        cell.titleLabel?.text = self.items[indexPath.row]
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        if (cell.ticked!){
            print("Selected")
            cell.tickerImage.backgroundColor = UIColor.greenColor()
        } else {
            print("Deselected")
            cell.tickerImage.backgroundColor = UIColor.redColor()
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell:CustomTableViewCell = tableView.cellForRowAtIndexPath(indexPath)! as! CustomTableViewCell
        
        if (selectedCell.ticked!){
            print("Deselecting")
            selectedCell.ticked = false
            selectedCell.tickerImage.backgroundColor = UIColor.redColor()
        } else {
            print("Selecting")
            selectedCell.ticked = true
            selectedCell.tickerImage.backgroundColor = UIColor.greenColor()
        }
        
    
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let deSelectedCell:CustomTableViewCell = tableView.cellForRowAtIndexPath(indexPath)! as! CustomTableViewCell
        if (deSelectedCell.ticked!){
            print("Keep Selected")
            deSelectedCell.tickerImage.backgroundColor = UIColor.greenColor()
        } else {
            print("Keep Deselected")
            deSelectedCell.tickerImage.backgroundColor = UIColor.redColor()
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
}
