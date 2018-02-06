//
//  DFUVC.swift
//  bledemo
//
//  Created by Rusty Huang on 2017/9/10.
//  Copyright © 2017年 Rusty Huang. All rights reserved.
//

import UIKit
import BLESDK

class DFUVC: UIViewController
{
    var firwarePath:String = ""
    var zipResourceName:[String]!
    var zipResourcePath:[URL]!
    var selectedRow = -1
    
    @IBOutlet weak var dfuUploadProgressView : UIProgressView!
    @IBOutlet weak var dfuUploadStatus       : UILabel!
    @IBOutlet weak var dfuStatusLabel        : UILabel!

    @IBOutlet weak var m_pTFZip                 : UITextField!
    @IBOutlet weak var m_pBtnSelect             : UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        BeaconAPI.sharedInstance.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func pressSelect(_ sender: Any)
    {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        do {
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory(at: URL.init(fileURLWithPath: documentsPath), includingPropertiesForKeys: nil, options: [])
            print(directoryContents)
            
            // if you want to filter the directory contents you can do like this:
            let zipFiles = directoryContents.filter{ $0.pathExtension == "zip" }
            print("zip urls:",zipFiles)
            let zipFileNames = zipFiles.map{ $0.deletingPathExtension().lastPathComponent }
            print("zip list:", zipFileNames)
            
            zipResourceName = zipFileNames
            zipResourcePath = zipFiles
            
            print("zip list:", zipResourceName)
            
            let picker: UIPickerView
            picker = UIPickerView(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: 216))
            picker.backgroundColor = UIColor.gray
            
            picker.showsSelectionIndicator = true
            picker.delegate = self
            picker.dataSource = self
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.default
            toolBar.tintColor = UIColor.gray
            toolBar.sizeToFit()
            
            
            
            
            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action:#selector(donePicker(_:)))
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
            
            toolBar.setItems([spaceButton, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            
            m_pTFZip.inputView = picker
            m_pTFZip.inputAccessoryView = toolBar
            
            m_pTFZip.becomeFirstResponder()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func pressDFU_107(_ sender: Any)
    {
        if let resourceUrl = Bundle.main.url(forResource: "collar_107", withExtension: "zip", subdirectory: "")
        {
            BeaconAPI.sharedInstance.performDFU(resourceUrl)
        }

    }
    
    
    
    @IBAction func pressStartDFU(_ sender: Any)
    {
//        if let resourceUrl = Bundle.main.url(forResource: "Thermo_001", withExtension: "zip", subdirectory: "")
//        {
//            BeaconAPI.sharedInstance.performDFU(resourceUrl)
//        }
        
        if  selectedRow < zipResourcePath.count
        {
            let resourceUrl:URL = zipResourcePath[selectedRow]
            
            
            if resourceUrl.absoluteString != ""
            {
                BeaconAPI.sharedInstance.performDFU(resourceUrl)
            }
        }
    }
    
    
    @IBAction func donePicker(_ sender: Any)
    {
        m_pTFZip.resignFirstResponder()
        
        if selectedRow < zipResourceName.count
        {
            let strFileName:String = zipResourceName[selectedRow]
            
            m_pBtnSelect.titleLabel?.text = strFileName
        }
    }

}

extension DFUVC : BeaconAPIDelegate
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
        print("Changed state to: \(state.description())")
        
    }
    
}

extension DFUVC : UIPickerViewDataSource
{
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return zipResourceName.count
    }
}

extension DFUVC : UIPickerViewDelegate
{
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        
        print("zipResourceName[\(row)] = \(zipResourceName[row])")
        
        return zipResourceName[row]
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedRow = row
    }
    
}

