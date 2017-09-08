//
//  DetailViewController.swift
//  bledemo
//
//  Created by Rusty Huang on 2017/5/4.
//  Copyright © 2017年 Rusty Huang. All rights reserved.
//

import UIKit
import CoreBluetooth
import PKHUD
import Toast_Swift
import BLESDK

class DetailViewController: UIViewController
{
    var m_pBeacon:mBeacon?

    //MARK: - View Outlets
    @IBOutlet weak var peripheralNameLabel   : UILabel!
    @IBOutlet weak var m_pTFPw: UITextField!
    @IBOutlet weak var m_pLblStatus: UILabel!
    @IBOutlet weak var m_pTFUserID: UITextField!
    @IBOutlet weak var m_pLblBeaconID: UILabel!
    @IBOutlet weak var m_pTFNickName: UITextField!
    @IBOutlet weak var m_pMainScrollView: UIScrollView!
    @IBOutlet weak var m_pCntView: UIView!
    
    @IBOutlet weak var dfuUploadProgressView : UIProgressView!
    @IBOutlet weak var dfuUploadStatus       : UILabel!
    @IBOutlet weak var dfuStatusLabel        : UILabel!
    //MARK: - override

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        m_pBeacon = BeaconAPI.sharedInstance.getCurrentBeacon()
        
        peripheralNameLabel.text = m_pBeacon?.beaconDeviceName
        self.m_pLblBeaconID.text = m_pBeacon?.macId
    }

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.m_pMainScrollView.contentSize = self.m_pCntView.frame.size

        
        BeaconAPI.sharedInstance.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- IBAction
    
    @IBAction func pressLogin1(_ sender: Any)
    {
        HUD.show(.progress)
        let userID:String = self.m_pTFUserID.text!
        let beaconID:String = self.m_pLblBeaconID.text!
        BeaconAPI.sharedInstance.updateDataLog(m_pBeacon, userID, beaconID, { (state) -> Void in
            
            if state == BeaconAPI.UploadDataStatus.success
            {
                self.view.makeToast(NSLocalizedString("上傳成功", comment: ""),
                                    duration: 1,
                                    position: .center)
            }
            else
            {
                self.view.makeToast(NSLocalizedString("上傳成功", comment: ""),
                                    duration: 1,
                                    position: .center)
            }

            
            HUD.hide()
            
            
        })
    }
    
    @IBAction func pressLogin2(_ sender: Any)
    {
        BeaconAPI.sharedInstance.callBuzzer(m_pBeacon)
        
        
        let bResult:Bool = BeaconAPI.sharedInstance.callBuzzerWithValue(m_pBeacon, 64)
        
        if bResult
        {
            
        }
        else
        {
            
        }
    }
    
    @IBAction func pressChangePwd1(_ sender: Any)
    {
        BeaconAPI.sharedInstance.readBattery(m_pBeacon,{ (responseDic) -> Void in
            
            self.view.makeToast(NSLocalizedString("\(responseDic)", comment: ""),
                                duration: 5,
                                position: .center)

        })

    }
    
    
    @IBAction func pressChangePwd2(_ sender: Any)
    {
        HUD.show(.progress)
        let userID:String = self.m_pTFUserID.text!
        let beaconID:String = self.m_pLblBeaconID.text!
        
        BeaconAPI.sharedInstance.getDataByDate(UserID: userID, BeaconID: beaconID, Date: "2017-06-19", completeHandler: { (response) -> Void in
        
        
        })
        
        BeaconAPI.sharedInstance.getDataByMonth(UserID: userID, BeaconID: beaconID, Month: "2017-06", completeHandler: { (response) -> Void in
            
            
        })
        
        
        BeaconAPI.sharedInstance.getDataByYear(UserID: userID, BeaconID: beaconID, Year: "2017",  completeHandler: { (response) -> Void in
            
            if let dic:[String:Any] = response
            {
                let status:String = dic["status"] as! String
                let msg:String = dic["msg"] as! String
                let list:[Any] = dic["list"] as! [Any]
                
                //print("list is \(list)")
            
            }
            HUD.hide()
        })

    }
    
    
    
    @IBAction func pressRegister(_ sender: Any)
    {
        HUD.show(.progress)
        let userID:String = self.m_pTFUserID.text!
        BeaconAPI.sharedInstance.RegisterUser(UserID: userID, FireBaseKey: nil, completeHandler: { (response) -> Void in
            
            if let dic:[String:Any] = response
            {
                let status:String = dic["status"] as! String
                let msg:String = dic["msg"] as! String
                
                if status == "OK"
                {
                    self.view.makeToast(NSLocalizedString("註冊成功", comment: ""),
                                        duration: 1,
                                        position: .center)
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
    
    @IBAction func pressGetDeviceList(_ sender: Any)
    {
        
    }
    
    @IBAction func pressBinding(_ sender: Any)
    {
        HUD.show(.progress)
        let userID:String = self.m_pTFUserID.text!
        let beaconID:String = self.m_pLblBeaconID.text!
        let nickName:String = self.m_pTFNickName.text!
        
        
        
        BeaconAPI.sharedInstance.bindBeaconWithUser(UserID: userID, BeaconID: beaconID, NickName: nickName,  completeHandler: { (response) -> Void in
            
            if let dic:[String:Any] = response
            {
                let status:String = dic["status"] as! String
                let msg:String = dic["msg"] as! String
                
                if status == "OK"
                {
                    self.view.makeToast(NSLocalizedString("綁定成功", comment: ""),
                                        duration: 1,
                                        position: .center)
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
    
    @IBAction func pressEnableBootloader(_ sender: Any)
    {
        BeaconAPI.sharedInstance.enableBootLoader(m_pBeacon, completeHandler: { (state:BeaconAPI.BootloaderState) -> Void in
            
            if state == BeaconAPI.BootloaderState.enable
            {
                //print("成功");
            }
        })
    }
    
    @IBAction func pressStartDFU(_ sender: Any)
    {
        if let resourceUrl = Bundle.main.url(forResource: "collar_106", withExtension: "zip", subdirectory: "")
        {
           BeaconAPI.sharedInstance.performDFU(resourceUrl)
        }
        
        
    }
    
    //MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool
    {
        return identifier == "showBindingList"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showBindingList"
        {
            //Sent the peripheral in the dfu view
            let deviceBindingList = segue.destination as! DeviceBindingList
            deviceBindingList.m_pUserID = self.m_pTFUserID.text
            
        }
    }
    
    
}

extension DetailViewController:UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
}

extension DetailViewController : BeaconAPIDelegate
{
    func dfuProgressUpdate(for part: Int,
                           outOf totalParts: Int,
                           to progress: Int,
                           currentSpeedBytesPerSecond: Double,
                           avgSpeedBytesPerSecond: Double) -> Void
    {
        dfuUploadProgressView.setProgress(Float(progress)/100.0, animated: true)
        dfuUploadStatus.text = String(format: "Part: %d/%d\nSpeed: %.1f KB/s\nAverage Speed: %.1f KB/s",
                                      part, totalParts, currentSpeedBytesPerSecond/1024, avgSpeedBytesPerSecond/1024)
    }

    func dfuStatusUpdate(to state: BeaconAPI_DFUState) -> Void
    {
        
        dfuStatusLabel.text = state.description()
        //print("Changed state to: \(state.description())")

    }
    
}
