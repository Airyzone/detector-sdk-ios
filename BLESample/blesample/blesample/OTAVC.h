//
//  OTAVC.h
//  blesample
//
//  Created by Rusty Huang on 2017/7/20.
//  Copyright © 2017年 Rusty Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTAVC : UIViewController
{
    
}


@property (weak, nonatomic) IBOutlet UIProgressView *m_pProgressView;
@property (weak, nonatomic) IBOutlet UILabel *m_pLblStatus;


- (IBAction)pressDFU:(id)sender;

@end
