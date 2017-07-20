//
//  OTAVC.m
//  blesample
//
//  Created by Rusty Huang on 2017/7/20.
//  Copyright © 2017年 Rusty Huang. All rights reserved.
//

#import "OTAVC.h"
@import BLESDK;

@interface OTAVC () <BeaconAPIDelegate>

@end

@implementation OTAVC

- (void)viewDidLoad {
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

- (IBAction)pressDFU:(id)sender
{
    [[BeaconAPI sharedInstance] setDelegate:self];
    
    
    NSString *pstrFilePath = [[NSBundle mainBundle] pathForResource:@"collar_dev_104" ofType:@"zip"];
    
    
    [[BeaconAPI sharedInstance] performDFU:[NSURL fileURLWithPath:pstrFilePath]];
}


#pragma mark - BeaconAPIDelegate
- (void)dfuProgressUpdateFor:(NSInteger)part outOf:(NSInteger)totalParts to:(NSInteger)progress currentSpeedBytesPerSecond:(double)currentSpeedBytesPerSecond avgSpeedBytesPerSecond:(double)avgSpeedBytesPerSecond
{
    [self.m_pProgressView setProgress:((CGFloat)(progress)) / 100.0f animated:YES];
    [self.m_pLblStatus setText:[NSString stringWithFormat:@"Part: %d/%d\nSpeed: %.1f KB/s\nAverage Speed: %.1f KB/s",
                               part, totalParts, currentSpeedBytesPerSecond/1024, avgSpeedBytesPerSecond/1024]];

}
- (void)dfuStatusUpdateTo:(enum BeaconAPI_DFUState)state
{
    self.m_pLblStatus.text = [NSString stringWithFormat:@"status == %ld", (long)state];
}
@end
