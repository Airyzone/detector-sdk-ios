//
//  mBeaconConstant.h
//  BVSDKSample
//
//  Created by Judy Wang on 2014/5/16.
//  Copyright (c) 2014年 Airyzone Co. All rights reserved.
//
/**
 *  This document describes the constants found in the mBeacon SDK
 */


#define mBEACON_IPHONE_TO_BLE_LEN           20          /* iPhone to BLE buffer length */
#define mBEACON_BLE_TO_IPHONE_LEN           20          /* BLE to iPhone buffer length */

#define mBEACON_VERIFICATION_RESULT_LEN     15        /* mBeacon verification result buffer length */


#define mBeacon_BLE_SERVICE_UUID_STRING   @"7410"


#define mBeacon20_BLE_MAIN_SERVICE_UUID_STRING      @"6410"
#define mBeacon20_BLE_NOTIFY_SERVICE_UUID_STRING    @"6411"
#define mBeacon20_BLE_SOS_SERVICE_UUID_STRING       @"6412"
#define mBeacon20_BLE_OTA_SERVICE_UUID_STRING       @"6413"
#define mBeacon20_BLE_READ_SERVICE_UUID_STRING      @"6420"
#define mBeacon20_BLE_WRITE_SERVICE_UUID_STRING     @"6421"
#define mBeacon20_BLE_COLLAR_SERVICE_UUID_STRING    @"6450"
#define mBeacon20_BLE_COLLAR_WRITE_UUID_STRING      @"6451"
#define mBeacon20_BLE_COLLAR_READ_UUID_STRING       @"6452"

#define mBEACON_ID_LENGTH                   12

/**
 *  mBeacon type constant
 */
enum Type
{
    NonActivate = 0,                                   /* non activate mBeacon */
    UnKnownBeacon=100                                  /* unKnown BLE device */
};


/**
 *  proximity type for mBeacon
 */
typedef enum
{
    Immediate = 0,
    Near = 1,
    Far = 2,
    Unknown = 3
}proximityType;

