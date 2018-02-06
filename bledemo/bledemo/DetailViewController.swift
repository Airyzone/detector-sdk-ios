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
    @IBOutlet weak var m_pTFPw: UITextField!
    @IBOutlet weak var m_pLblStatus: UILabel!
    @IBOutlet weak var m_pTFUserID: UITextField!
    @IBOutlet weak var m_pTFNickName: UITextField!
    @IBOutlet weak var m_pMainScrollView: UIScrollView!
    @IBOutlet weak var m_pCntView: UIView!
    

    //MARK: - override

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        m_pBeacon = BeaconAPI.sharedInstance.getCurrentBeacon()
        
        self.title = m_pBeacon?.macId
        
    }

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.m_pMainScrollView.contentSize = self.m_pCntView.frame.size


        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- IBAction
    
    @IBAction func pressUpdateLog(_ sender: Any)
    {
        let userID:String = self.m_pTFUserID.text!
        
        if  userID == ""
        {
            self.view.makeToast(NSLocalizedString("請先輸入UserID", comment: ""),
                                duration: 1,
                                position: .center)
            
            return
        }
        

        HUD.show(.progress)
     
        let beaconID:String = self.title!
        BeaconAPI.sharedInstance.updateDataLog(m_pBeacon, userID, beaconID, { (state) -> Void in
            
            if state == BeaconAPI.UploadDataStatus.success
            {
                self.view.makeToast(NSLocalizedString("上傳成功", comment: ""),
                                    duration: 1,
                                    position: .center)
            }
            else if state == BeaconAPI.UploadDataStatus.noNewData
            {
                self.view.makeToast(NSLocalizedString("尚未有新的資料", comment: ""),
                                    duration: 1,
                                    position: .center)
            }
            else
            {
                self.view.makeToast(NSLocalizedString("上傳失敗", comment: ""),
                                    duration: 1,
                                    position: .center)
            }

            
            HUD.hide()
            
            
        })
    }
    
    @IBAction func pressBuzzer(_ sender: Any)
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
    
    @IBAction func pressReadBattery(_ sender: Any)
    {
        BeaconAPI.sharedInstance.readBattery(m_pBeacon,{ (responseDic) -> Void in
            
            self.view.makeToast(NSLocalizedString("\(responseDic)", comment: ""),
                                duration: 5,
                                position: .center)

        })

    }
    
    @IBAction func pressReadFirmwareInfo(_ sender: Any)
    {
        BeaconAPI.sharedInstance.readFirmwareInfo(m_pBeacon,{ (responseDic) -> Void in
            
            self.view.makeToast(NSLocalizedString("\(responseDic)", comment: ""),
                                duration: 5,
                                position: .center)
            
        })
        
    }
    
    
    @IBAction func pressGetLog(_ sender: Any)
    {
        let userID:String = self.m_pTFUserID.text!
        
        if  userID == ""
        {
            self.view.makeToast(NSLocalizedString("請先輸入UserID", comment: ""),
                                duration: 1,
                                position: .center)
            
            return
        }
        
        
        HUD.show(.progress)

        let beaconID:String = self.title!
        
//        BeaconAPI.sharedInstance.getDataByDate(UserID: userID, BeaconID: beaconID, Date: "2017-06-19", completeHandler: { (response) -> Void in
//        
//        
//        })
        
//        BeaconAPI.sharedInstance.getDataByMonth(UserID: userID, BeaconID: beaconID, Month: "2017-06", completeHandler: { (response) -> Void in
//            
//            
//        })
        
        
        BeaconAPI.sharedInstance.getDataByYear(UserID: userID, BeaconID: beaconID, Year: "2017",  completeHandler: { (response) -> Void in
            
            if let dic:[String:Any] = response
            {
                let status:String = dic["status"] as! String
                let msg:String = dic["msg"] as! String
                let list:[Any] = dic["list"] as! [Any]
                
                print("list is \(list)")
            
            }
            HUD.hide()
        })

    }
    
    
    
    @IBAction func pressRegister(_ sender: Any)
    {
        let userID:String = self.m_pTFUserID.text!
        
        if  userID == ""
        {
            self.view.makeToast(NSLocalizedString("請先輸入UserID", comment: ""),
                                duration: 1,
                                position: .center)
            
            return
        }
        
        
        HUD.show(.progress)
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
        let userID:String = self.m_pTFUserID.text!
        
        if  userID == ""
        {
            self.view.makeToast(NSLocalizedString("請先輸入UserID", comment: ""),
                                duration: 1,
                                position: .center)
            
            return
        }
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "DeviceBinding") as! DeviceBindingList
        
        vc.m_pUserID = userID
        
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func pressBinding(_ sender: Any)
    {
        let userID:String = self.m_pTFUserID.text!
        
        if  userID == ""
        {
            self.view.makeToast(NSLocalizedString("請先輸入UserID", comment: ""),
                                duration: 1,
                                position: .center)
            
            return
        }
        
        let nickName:String = self.m_pTFNickName.text!
        if  nickName == ""
        {
            self.view.makeToast(NSLocalizedString("請先輸入Nickname", comment: ""),
                                duration: 1,
                                position: .center)
            
            return
        }
        
        
        HUD.show(.progress)
        let beaconID:String = self.title!
        
        
        
        
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
                print("成功");
            }
        })
    }
    
    //MARK: - Navigation
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool
//    {
//        return identifier == "showBindingList"
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if segue.identifier == "showBindingList"
//        {
//            //Sent the peripheral in the dfu view
//            let deviceBindingList = segue.destination as! DeviceBindingList
//            deviceBindingList.m_pUserID = self.m_pTFUserID.text
//            
//        }
//    }
    
    
    @objc func keyboardWillShow(notification: NSNotification)
    {
        self.m_pMainScrollView.frame.size.height = self.view.frame.size.height - 200
    }
    
    @objc func keyboardWillHide(notification: NSNotification)
    {
        self.m_pMainScrollView.frame.size.height = self.view.frame.size.height
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
