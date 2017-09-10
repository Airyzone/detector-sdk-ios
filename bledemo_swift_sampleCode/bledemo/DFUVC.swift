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
    
    @IBOutlet weak var dfuUploadProgressView : UIProgressView!
    @IBOutlet weak var dfuUploadStatus       : UILabel!
    @IBOutlet weak var dfuStatusLabel        : UILabel!

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
    
    @IBAction func pressStartDFU(_ sender: Any)
    {
        if let resourceUrl = Bundle.main.url(forResource: "collar_106", withExtension: "zip", subdirectory: "")
        {
            BeaconAPI.sharedInstance.performDFU(resourceUrl)
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
        //print("Changed state to: \(state.description())")
        
    }
    
}
