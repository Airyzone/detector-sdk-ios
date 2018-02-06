//
//  DeviceBindingList.swift
//  bledemo
//
//  Created by Rusty Huang on 2017/5/24.
//  Copyright © 2017年 Rusty Huang. All rights reserved.
//

import UIKit
import BLESDK
import PKHUD

class DeviceBindingList: UITableViewController
{
    var m_pUserID:String!
    var deviceList:[Any]! = [Any]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.title = self.m_pUserID
        
        self.getDeviceList()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return deviceList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCellIdentifier", for: indexPath)

        
        if let dic:[String:Any] = deviceList[indexPath.row] as? [String:Any]
        {
            cell.textLabel?.text = "\(String(describing: dic["beacon_name"]!))"
            cell.detailTextLabel?.text = "\(String(describing: dic["beacon_id"]!))"
        }
    
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath)
    {
        let dic:[String:Any] = deviceList[indexPath.row] as! [String:Any]
        self.view.makeToast(NSLocalizedString(dic.description, comment: ""),
                            duration: 1,
                            position: .center)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let dic:[String:Any] = deviceList[indexPath.row] as! [String:Any]
        
        
        let question = UIAlertController(title: "\(String(describing: dic["beacon_name"]!))", message: "是否要解除綁定", preferredStyle: .alert);
        
        //新增選項
        let yes = UIAlertAction(title: "解除綁定", style: .default , handler:{
            (action:UIAlertAction!) -> Void in
            self.callUnMappingDevice(dic: dic)
            
        });
        let no = UIAlertAction(title: "下次再說", style: .default , handler:{
            (action:UIAlertAction!) -> Void in
            
            
        });
        
        //把選項加到UIAlertController
        question.addAction(yes);
        question.addAction(no);
        //Show
        self.present(question, animated: true, completion: nil)

        
    }
 

    //MARK:- Private
    func getDeviceList() -> Void
    {
        HUD.show(.progress)
        
        BeaconAPI.sharedInstance.getUserDeviceList(UserID: m_pUserID, completeHandler: { (response) -> Void in
            
            if let dic:[String:Any] = response
            {
                let status:String = dic["status"] as! String
                let msg:String = dic["msg"] as! String
                if status == "OK"
                {
                    self.deviceList = dic["list"] as! [Any]
                    
                    print("deviceList = \(self.deviceList)")
                    //                    self.view.makeToast(NSLocalizedString(deviceList.description, comment: ""),
                    //                                        duration: 1,
                    //                                        position: .center)
                    self.tableView.reloadData()
                }
                else
                {
                    self.view.makeToast(NSLocalizedString(msg, comment: ""),
                                        duration: 1,
                                        position: .center)
                }
                
            }
            else
            {
                self.view.makeToast(NSLocalizedString("無回傳資料", comment: ""),
                                    duration: 1,
                                    position: .center)
            }
            
            
            HUD.hide()
        })

    }
    
    func callUnMappingDevice(dic:[String:Any]) -> Void
    {
        HUD.show(.progress)
        let userID:String = dic["user_id"]! as! String
        let beaconID:String = dic["beacon_id"]! as! String
        
        BeaconAPI.sharedInstance.unBindBeaconWithUser(UserID: userID, BeaconID: beaconID,  completeHandler: { (response) -> Void in
            
            if let dic:[String:Any] = response
            {
                let status:String = dic["status"] as! String
                let msg:String = dic["msg"] as! String
                
                if status == "OK"
                {
                    self.view.makeToast(NSLocalizedString("解除綁定成功", comment: ""),
                                        duration: 1,
                                        position: .center)
                    self.getDeviceList()
                }
                else
                {
                    self.view.makeToast(NSLocalizedString(msg, comment: ""),
                                        duration: 1,
                                        position: .center)
                }
                
            }
            else
            {
                self.view.makeToast(NSLocalizedString("無回傳資料", comment: ""),
                                    duration: 3,
                                    position: .center)
            }
            
            
            HUD.hide()
        })

    }
}
