//
//  CustomTableViewCell.swift
//  SwiftLoginScreen
//
//  Created by Alejandro Castillejo on 4/30/16.
//  Copyright © 2016 Dipin Krishna. All rights reserved.
//

import UIKit
import Foundation

class CustomTableViewCell : UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)!
    }
    
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
}
