//
//  ViewController.swift
//  bledemo
//
//  Created by Rusty Huang on 2017/5/3.
//  Copyright © 2017年 Rusty Huang. All rights reserved.
//

import UIKit
import CoreBluetooth
import PKHUD
import BLESDK

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    let AIRYZON_APP_ID                       = ""
    let AIRYZON_API_KEY                      = ""
    
    
    @IBOutlet weak var discoveredPeripheralsTableView: UITableView!
    
    var scanningStarted             : Bool = false
    var discoveredPeripherals       : [mBeacon]
    
    required init?(coder aDecoder: NSCoder)
    {
        discoveredPeripherals   = [mBeacon]()
        
        super.init(coder: aDecoder)
        
        _ = BeaconAPI.sharedInstance.initAPI(APPID: AIRYZON_APP_ID, APPKey: AIRYZON_API_KEY)
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
       
        let scan = UIBarButtonItem(title: "Scan", style: .plain, target: self, action: #selector(scanDevice))
        
        navigationItem.rightBarButtonItems = [scan]
        
        
        self.scanDevice()
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Menu pressed
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotificationForBleDisconnected), name: Notifications.POST_NOTIFICATION_DISCONNECT, object: nil)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- Notification
    func handleNotificationForBleDisconnected() -> Void
    {
        //建立UIAlertController
        let question = UIAlertController(title: "Device Disconnected", message: "", preferredStyle: .alert);
        
        //新增選項
        let yes = UIAlertAction(title: "OK", style: .default , handler:{
            (action:UIAlertAction!) -> Void in
            self.navigationController?.popToRootViewController(animated: true)
            
        });
        
        //把選項加到UIAlertController
        question.addAction(yes);
        //Show
        self.present(question, animated: true, completion: nil)

    }
    
    
    //MARK: -  Functions
    func scanDevice()
    {
        HUD.show(.progress)
        
        BeaconAPI.sharedInstance.scanBeacon(Timer: 2.0, { (state:BeaconAPI.ScanState) -> Void in
        
            HUD.hide()
            if state == BeaconAPI.ScanState.Success
            {
                self.discoveredPeripherals = BeaconAPI.sharedInstance.getBeaconList()
                self.discoveredPeripheralsTableView.reloadData()
                
            }
            else if state == BeaconAPI.ScanState.Scanning
            {
                //print("still scanning")
            }
        
        })
    }
    
    func callActivateBeacon( beacon:mBeacon ) -> Void
    {
        HUD.show(.progress)
        BeaconAPI.sharedInstance.activateBeacon(beacon, {(state:BeaconAPI.ActivateState) -> Void in
            
            if state == BeaconAPI.ActivateState.Success
            {
                self.view.makeToast(NSLocalizedString("開通成功", comment: ""),
                                    duration: 1,
                                    position: .center)

            }
            else
            {
                self.view.makeToast(NSLocalizedString("開通失敗", comment: ""),
                                    duration: 1,
                                    position: .center)

            }
            
            HUD.hide()
        })
    }
    
    func showActivateAlert( beacon:mBeacon ) -> Void
    {
        let question = UIAlertController(title: "\(beacon.macId!)", message: "尚未開通，是否要立即開通", preferredStyle: .alert);
        
        //新增選項
        let yes = UIAlertAction(title: "立即開通", style: .default , handler:{
            (action:UIAlertAction!) -> Void in
            self.callActivateBeacon(beacon: beacon)
            
        });
        let no = UIAlertAction(title: "下次再說", style: .default , handler:{
            (action:UIAlertAction!) -> Void in
            self.connectBeacon(beacon: beacon)
            
            
        });
        
        //把選項加到UIAlertController
        question.addAction(yes);
        question.addAction(no);
        //Show
        self.present(question, animated: true, completion: nil)
    }
    
    func connectBeacon(beacon:mBeacon) -> Void
    {
        HUD.show(.progress)
        BeaconAPI.sharedInstance.connectBeacon(beacon, { (state:BeaconAPI.ConnectState) -> Void in
            
            if state == BeaconAPI.ConnectState.Connected
            {
                //print("Beacon Connected")
                self.performSegue(withIdentifier: "showDetail", sender: self)
            }
            else if state == BeaconAPI.ConnectState.ConnectFailed
            {
                //print("Beacon Connect Failed")
            }
            
            HUD.hide()
        })
    }
    
    func connectOTABeacon(beacon:mBeacon) -> Void
    {
        HUD.show(.progress)
        BeaconAPI.sharedInstance.connectOTABeacon(beacon, { (state:BeaconAPI.ConnectState) -> Void in
            
            if state == BeaconAPI.ConnectState.Connected
            {
                //print("Beacon Connected")
                self.performSegue(withIdentifier: "showDFU", sender: self)
            }
            else if state == BeaconAPI.ConnectState.ConnectFailed
            {
                //print("Beacon Connect Failed")
            }
            
            HUD.hide()
        })
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return discoveredPeripherals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCellIdentifier", for: indexPath) as! DeviceCell
        
        let beacon:mBeacon = discoveredPeripherals[indexPath.row]
        
        cell.m_pLblName.text = beacon.beaconDeviceName
        cell.m_pLblDeviceID.text = beacon.macId
        cell.m_pLblMajorMiner.text = "major: \(beacon.major) miner:\(beacon.miner)"
        cell.m_pLblTime.text = beacon.lastDiscoveryTime.description
        
        var pstrProximity:String = ""
        //print("beacon.proximity \( beacon.proximity )")
        switch (beacon.proximity) {
        case 0:
            pstrProximity = "Immediate"
        case 1:
            pstrProximity = "Near"
        case 2:
            pstrProximity = "Far"
        default:
            pstrProximity = "Unknown"
        }
        
        
        
        cell.m_pLblRSSI.text = "\(pstrProximity)(\(beacon.lastRssi!))"
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let beacon:mBeacon = discoveredPeripherals[indexPath.row]

        if beacon.beaconDeviceName == "AZ_OTA"
        {
            self.connectOTABeacon(beacon: beacon)
            
            return
        }
        else
        {
            //檢查是否開通
            HUD.show(.progress)
            BeaconAPI.sharedInstance.getBeaconInfo(BeaconID: beacon.macId,  completeHandler: { (response) -> Void in
                HUD.hide()
                if let dic:[String:Any] = response
                {
                    let status:String = dic["status"] as! String
                    let msg:String = dic["msg"] as! String
                    
                    if status == "OK"
                    {
                        self.connectBeacon(beacon: beacon)
                    }
                    else if status == "Fail"
                    {
                        self.showActivateAlert(beacon: beacon)
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
            })

        }
    }

    //MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool
    {
        return identifier == "showDetail"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showDetail"
        {
            //Sent the peripheral in the dfu view
            let detailViewController = segue.destination as! DetailViewController
            
        }
    }

    
}

