//
//  mBeacon.h
//
//
//  Created by Judy on 2013/12/12.
//  Copyright (c) 2013年 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

#define MIN_RSSI_IMMEDIATE -50
#define MAX_RSSI_IMMEDIATE   0
#define MIN_RSSI_NEAR      -80
#define MAX_RSSI_NEAR      -50
#define MAX_RSSI_FAR       -80


/**
 *  mBeacon is class for mBeacon BLE peripherial device
 */
@interface mBeacon : NSObject
{
    CBPeripheral	*peripheral;                // BLE peripheral information for this beacon
    int             type;                       // beacon type
    NSString        *macId;                     // beacon mac id. it's mac id of BLE chip
    NSString        *beaconDeviceName;          // beacon device name
    NSString        *uuidStr;                   // unique id between BLE chip and iOS device.
    NSString        *m_pstrUuidDataString;      // BLE UUID String
    int             subType;                    // subtype of type
    int             major;                      // for future usage
    int             miner;                      // for future usage
    int             reserved1;                  // for future usage. we don't have value right now
    int             proximity;                  // proximity indicator
    int             sdkType;                    // sdkType of type  10 , 20
                                                // Immediate: rssi is between 0 ~ -50
                                                // Near: rssi is between -50 ~ -80
                                                // Far: rssi is less than -80
                                                // Unknown: rssi is not Immediate, Near or far
    NSNumber        *rssi;                      // for future usage
    NSNumber        *lastRssi;                  // rssi value when discovery
    NSDate          *lastDiscoveryTime;         // discovery beacon time

}

/**
 *  BLE peripheral information for this beacon
 */
@property (nonatomic, readonly) CBPeripheral *peripheral;
/**
 *  beacon type
 */
@property (nonatomic, readonly) int type;
/**
 *  sdk type  10 , 20
 */
@property (nonatomic, readonly) int sdkType;
/**
 *  beacon mac id. it's mac id of BLE chip.
 */
@property (nonatomic, readonly) NSString *macId;
/**
 *  beacon device name. Most of time, it is will be the same as macId
 */
@property (nonatomic, readonly) NSString *beaconDeviceName;
/**
 *  unique id between BLE chip and iOS device
 */
@property (nonatomic, readonly) NSString *uuidStr;
/**
 *  unique id between BLE UUID
 */
@property (nonatomic, readonly) NSString        *m_pstrUuidDataString;
/**
 *  subtype of type
 */
@property (nonatomic, readonly) int subType;
/**
 *  major value for future usage
 */
@property (nonatomic, readonly) int major;
/**
 *  miner value for future usage
 */
@property (nonatomic, readonly) int miner;

@property (nonatomic, readonly) int             reserved1;

/**
 *  proximity indicator
 *
 *  Immediate: rssi is between 0 ~ -50
 *  Near: rssi is between -50 ~ -80
 *  Far: rssi is less than -80
 *  Unknown: rssi is not Immediate, Near or far
 */
@property (nonatomic, readonly) int proximity;
/**
 *   for future usage
 */
@property (nonatomic, readonly) NSNumber *rssi;
/**
 *  rssi value when discovery
 */
@property (nonatomic, readonly) NSNumber *lastRssi;

/**
 *  discovery beacon time
 */
@property (nonatomic, readonly) NSDate *lastDiscoveryTime;

/**
 *  init mBeacon class
 *
 *  @param scanPeripheral    mBeacon peripheral
 *  @param advertisementData mBeacon BLE advertisement data
 *  @param RSSI              rssi value
 *
 *  @return mBeacon object
 */
-(id)initWithmBeacon:(CBPeripheral *)scanPeripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI;
/**
 *  modify mBeacon RSSI for multiple BLE discovery
 *
 *  @param RSSI mBeacon RSSI
 */
-(void)modifymBeacon:(NSNumber *)RSSI;
/**
 *  init mBeacon object in iOS App background running
 *  iOS App will not get BLE peripheral local name when App is running in background
 *  Therefore, this function proivde different mBeacon init method from forground. 
 *  mBeacon beaconDeviceName is the same as macId in App background mode
 *
 *  @param scanPeripheral    mBeacon peripheral
 *  @param advertisementData mBeacon advertsement data
 *  @param RSSI              mBeacon RSS
 *
 *  @return mBeacon object when App is running in background
 */
-(id)initWithBackgroundmBeacon:(CBPeripheral *)scanPeripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI;

-( NSData * )getLoginDataWithLevel:(NSString *)pwd Level:( NSInteger )nLevel;
-( NSData * )getChangePwDataWithLevel:(NSString *)pwd Level:( NSInteger )nLevel;
- ( int )getSeedValue;

@end
