//
//  DetailVC.m
//  blesample
//
//  Created by Rusty Huang on 2017/7/20.
//  Copyright © 2017年 Rusty Huang. All rights reserved.
//

#import "DetailVC.h"
#import "MBProgressHUD.h"


@import BLESDK;

@interface DetailVC ()
{
    
}

@end

@implementation DetailVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pressBattery:(id)sender
{
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    
    [[BeaconAPI sharedInstance] readBattery:[[BeaconAPI sharedInstance] getCurrentBeacon] :^( NSDictionary *pData)
    {
        [self.m_pLogView setText:[pData description]];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

- (IBAction)pressBuzzer:(id)sender
{
    [[BeaconAPI sharedInstance] callBuzzer:[[BeaconAPI sharedInstance] getCurrentBeacon]];
}

- (IBAction)pressUpload:(id)sender
{
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    
    mBeacon *beacon = [[BeaconAPI sharedInstance] getCurrentBeacon];
    
    //需事先申請UserID
    
    [[BeaconAPI sharedInstance] updateDataLog:beacon :@"UserID" :beacon.macId :^(UploadDataStatus state)
    {
     
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }];
}

- (IBAction)pressGetRecordForYear:(id)sender
{
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    
    
    mBeacon *beacon = [[BeaconAPI sharedInstance] getCurrentBeacon];
    [[BeaconAPI sharedInstance] getDataByYearWithUserID:@"UseriD" BeaconID:beacon.macId Year:@"2017" completeHandler:^(NSDictionary * pData)
     {
         [self.m_pLogView setText:[pData description]];
         
         [MBProgressHUD hideHUDForView:self.view animated:YES];
     }];
}

- (IBAction)pressGetRecordForMonth:(id)sender
{
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    
    mBeacon *beacon = [[BeaconAPI sharedInstance] getCurrentBeacon];
    [[BeaconAPI sharedInstance] getDataByYearWithUserID:@"UseriD" BeaconID:beacon.macId Year:@"2017-07" completeHandler:^(NSDictionary * pData)
     {
         [self.m_pLogView setText:[pData description]];
         [MBProgressHUD hideHUDForView:self.view animated:YES];
     }];
}


- (IBAction)pressRecordForToday:(id)sender
{
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    
    mBeacon *beacon = [[BeaconAPI sharedInstance] getCurrentBeacon];
    [[BeaconAPI sharedInstance] getDataByYearWithUserID:@"UseriD" BeaconID:beacon.macId Year:@"2017-07-20" completeHandler:^(NSDictionary * pData)
     {
         [self.m_pLogView setText:[pData description]];
         [MBProgressHUD hideHUDForView:self.view animated:YES];
     }];
}

- (IBAction)pressEnableBootloader:(id)sender
{
    mBeacon *beacon = [[BeaconAPI sharedInstance] getCurrentBeacon];
    [[BeaconAPI sharedInstance] enableBootLoader:beacon completeHandler:^( BootloaderState state)
     {
         [self.navigationController popViewControllerAnimated:YES];
     }];
}
@end
