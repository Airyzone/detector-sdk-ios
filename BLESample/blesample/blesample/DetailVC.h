//
//  DetailVC.h
//  blesample
//
//  Created by Rusty Huang on 2017/7/20.
//  Copyright © 2017年 Rusty Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailVC : UIViewController
{
    
}
@property (weak, nonatomic) IBOutlet UITextView *m_pLogView;

- (IBAction)pressBattery:(id)sender;

- (IBAction)pressBuzzer:(id)sender;

- (IBAction)pressUpload:(id)sender;

- (IBAction)pressGetRecordForYear:(id)sender;

- (IBAction)pressGetRecordForMonth:(id)sender;

- (IBAction)pressRecordForToday:(id)sender;

- (IBAction)pressEnableBootloader:(id)sender;


@end
