//
//  ViewController.swift
//  BLE_TEST
//
//  Created by Rusty Huang on 2017/5/31.
//  Copyright © 2017年 Rusty Huang. All rights reserved.
//

import UIKit
import BLESDK

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        BeaconAPI.sharedInstance.initAPI(APPID: "", APPKey: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

