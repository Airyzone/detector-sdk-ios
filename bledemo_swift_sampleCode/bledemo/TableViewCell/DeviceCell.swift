//
//  DeviceCell.swift
//  bledemo
//
//  Created by Rusty Huang on 2017/5/17.
//  Copyright © 2017年 Rusty Huang. All rights reserved.
//

import Foundation
import UIKit

class DeviceCell: UITableViewCell
{
    @IBOutlet weak var m_pLblName: UILabel!
    @IBOutlet weak var m_pLblDeviceID: UILabel!
    @IBOutlet weak var m_pLblMajorMiner: UILabel!
    @IBOutlet weak var m_pLblTime: UILabel!
    @IBOutlet weak var m_pLblRSSI: UILabel!
    
    
    
    
    
    
    //MARK:- override
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
}
