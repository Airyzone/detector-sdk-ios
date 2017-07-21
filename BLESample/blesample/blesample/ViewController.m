//
//  ViewController.m
//  blesample
//
//  Created by Rusty Huang on 2017/7/11.
//  Copyright © 2017年 Rusty Huang. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"
#import "DetailVC.h"
#import "OTAVC.h"

#define kBeaconAPI_APPID        @"YourAppID"
#define kBeaconAPI_APPKEY       @"YourAppKey"

@import BLESDK;



@interface ViewController () <UITabBarDelegate, UITableViewDataSource>
{
    
}

@property ( nonatomic, retain ) NSArray      *m_pDeviceArray;

@end

@implementation ViewController
@synthesize m_pDeviceArray;

- ( id )initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if ( self )
    {
        self.m_pDeviceArray = nil;
    }
    
    return self;
}

-( void )viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    //請至本文件上方填入app id & app key
    [[BeaconAPI sharedInstance] initAPIWithAPPID:kBeaconAPI_APPID APPKey:kBeaconAPI_APPKEY];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hadleDisconnect) name:Notifications.POST_NOTIFICATION_DISCONNECT object:nil];
    
    
}

-( void )hadleDisconnect
{
    NSLog(@"斷線了");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    mBeacon *beacon = [m_pDeviceArray objectAtIndex:indexPath.row];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    
    if ( [beacon.beaconDeviceName compare:@"AZ_OTA"] == NSOrderedSame )
    {
        [[BeaconAPI sharedInstance] connectOTABeacon:beacon :^(ConnectState state)
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            OTAVC *pVC = [[OTAVC alloc] initWithNibName:@"OTAVC" bundle:nil];
            [self.navigationController pushViewController:pVC animated:YES];
            
        }];
    }
    else
    {
        
        [[BeaconAPI sharedInstance] checkBeaconExistWithBeaconID:beacon.macId
                                                 completeHandler:^( NSDictionary * pData )
         {
             NSString *pstrStatus = [pData objectForKey:@"status"];
             NSString *pstrMsg = [pData objectForKey:@"msg"];
             
             if ( [pstrStatus compare:@"OK" options:NSCaseInsensitiveSearch] == NSOrderedSame )
             {
                 //已開通
                 [[BeaconAPI sharedInstance] connectBeacon:beacon :^(ConnectState state)
                  {
                      [MBProgressHUD hideHUDForView:self.view animated:YES];
                      DetailVC *pVC = [[DetailVC alloc] initWithNibName:@"DetailVC" bundle:nil];
                      [self.navigationController pushViewController:pVC animated:YES];
                  }];
             }
             else
             {
                 //未開通
                 [[BeaconAPI sharedInstance] activateBeacon:beacon :^(ActivateState state)
                  {
                      if ( state == ActivateStateSuccess )
                      {
                          //開通完成
                          [MBProgressHUD hideHUDForView:self.view animated:YES];
                      }
                      
                      
                  }];
             }
         }];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger nCount = 0;
    
    nCount = [self.m_pDeviceArray count];
    
    return nCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *DeviceCellIdentifier = @"DeviceCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DeviceCellIdentifier];
    
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:DeviceCellIdentifier];
    }
    
    mBeacon *beacon = [m_pDeviceArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = beacon.beaconDeviceName;
    cell.detailTextLabel.text = beacon.macId;

    
    
    

    return cell;
}




- (IBAction)pressScan:(id)sender
{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    
    [[BeaconAPI sharedInstance] scanBeaconWithTimer:5.0f :^(ScanState state)
     {
         if ( state == ScanStateSuccess)
         {
             self.m_pDeviceArray = [[BeaconAPI sharedInstance] getBeaconList];
             
             NSLog(@"m_pDeviceArray = %@", [m_pDeviceArray description]);
             [self.m_pDeviceTableView reloadData];
             
             [MBProgressHUD hideHUDForView:self.view animated:YES];
         }
     }];

}
@end
