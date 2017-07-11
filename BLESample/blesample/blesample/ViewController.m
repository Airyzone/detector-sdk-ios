//
//  ViewController.m
//  blesample
//
//  Created by Rusty Huang on 2017/7/11.
//  Copyright © 2017年 Rusty Huang. All rights reserved.
//

#import "ViewController.h"


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


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [[BeaconAPI sharedInstance] initAPIWithAPPID:kBeaconAPI_APPID APPKey:kBeaconAPI_APPKEY];

    
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
    [[BeaconAPI sharedInstance] scanBeaconWithTimer:5.0f :^(ScanState state)
     {
         if ( state == ScanStateSuccess)
         {
             self.m_pDeviceArray = [[BeaconAPI sharedInstance] getBeaconList];
             
             NSLog(@"m_pDeviceArray = %@", [m_pDeviceArray description]);
             [self.m_pDeviceTableView reloadData];
         }
     }];

}
@end
