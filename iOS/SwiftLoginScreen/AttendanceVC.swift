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
    
    var items: [String] = ["Get out of bed", "Go to bathroom", "Take a shower", "Buy medicines", "Change position"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register custom cell
        self.tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        //Remove empty cells
        self.tableView.tableFooterView = UIView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if "attendanceSegue" == segue.identifier {
            let attendanceServices : NSMutableArray = []
            
            //BUG WHEN CALLING CELLFORROWATINDEXPATH when i is 5
//            for i in 0...self.items.count-1 {
//                let indexPath = NSIndexPath(forRow: i, inSection: 0)
//                let cell:CustomTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)! as! CustomTableViewCell
//                if (cell.ticked!) {
//                    attendanceServices.addObject((cell.titleLabel?.text)!)
//                    
//                }
//            }
            for i in 0...self.tableView.visibleCells.count - 1 {
                let indexPath = NSIndexPath(forRow: i, inSection: 0)
                let cell:CustomTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)! as! CustomTableViewCell
                if (cell.ticked!) {
                    attendanceServices.addObject((cell.titleLabel?.text)!)
                    
                }
            }
            
            let dvc = segue.destinationViewController as! LocationVC
            dvc.services = attendanceServices
            dvc.service = "Attendance"
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:CustomTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("CustomCell")! as! CustomTableViewCell
        cell.titleLabel?.text = self.items[indexPath.row]
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        if (cell.ticked!){
//            print("Selected")
            cell.tickerImage.image =  UIImage(named:"TickGreen.png")
        } else {
//            print("Deselected")
            cell.tickerImage.image =  nil
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell:CustomTableViewCell = tableView.cellForRowAtIndexPath(indexPath)! as! CustomTableViewCell
        
        if (selectedCell.ticked!){
//            print("Deselecting")
            selectedCell.ticked = false
            selectedCell.tickerImage.image =  nil
        } else {
//            print("Selecting")
            selectedCell.ticked = true
            selectedCell.tickerImage.image =  UIImage(named:"TickGreen.png")
        }
        
    
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let deSelectedCell:CustomTableViewCell = tableView.cellForRowAtIndexPath(indexPath)! as! CustomTableViewCell
        if (deSelectedCell.ticked!){
            print("Keep Selected")
            deSelectedCell.tickerImage.image =  UIImage(named:"TickGreen.png")
        } else {
            print("Keep Deselected")
            deSelectedCell.tickerImage.image =  nil
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
}
