// Generated by Apple Swift version 4.2 effective-3.4 (swiftlang-1000.11.37.1 clang-1000.11.45.1)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
@import CoreBluetooth;
@import Foundation;
@import ObjectiveC;
@import iOSDFULibrary;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="BLESDK",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

@protocol BeaconAPIDelegate;
enum ScanState : NSInteger;
@class mBeacon;
enum ConnectState : NSInteger;
enum ActivateState : NSInteger;
enum UploadDataStatus : NSInteger;
enum BootloaderState : NSInteger;

SWIFT_CLASS("_TtC6BLESDK9BeaconAPI")
@interface BeaconAPI : NSObject
@property (nonatomic, strong) id <BeaconAPIDelegate> _Nullable delegate;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) BeaconAPI * _Nonnull sharedInstance;)
+ (BeaconAPI * _Nonnull)sharedInstance SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_DEPRECATED_MSG("-init is unavailable");
- (void)initAPIWithAPPID:(NSString * _Nonnull)appID APPKey:(NSString * _Nonnull)appKey SWIFT_METHOD_FAMILY(none);
- (void)scanBeaconWithTimer:(NSTimeInterval)timer :(void (^ _Nonnull)(enum ScanState))completionHandler;
- (NSArray<mBeacon *> * _Nonnull)getBeaconList SWIFT_WARN_UNUSED_RESULT;
- (void)connectBeacon:(mBeacon * _Nullable)beacon :(void (^ _Nonnull)(enum ConnectState))completionHandler;
- (void)connectOTABeacon:(mBeacon * _Nullable)beacon :(void (^ _Nonnull)(enum ConnectState))completionHandler;
- (void)disConnectBeacon:(mBeacon * _Nullable)beacon :(void (^ _Nonnull)(enum ConnectState))completionHandler;
- (mBeacon * _Nullable)getCurrentBeacon SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)getLastResult SWIFT_WARN_UNUSED_RESULT;
- (void)activateBeacon:(mBeacon * _Nullable)beacon :(void (^ _Nonnull)(enum ActivateState))completionHandler;
- (void)callBuzzer:(mBeacon * _Nullable)beacon;
- (BOOL)callBuzzerWithValue:(mBeacon * _Nullable)beacon :(uint8_t)value SWIFT_WARN_UNUSED_RESULT;
- (void)readRecordData:(mBeacon * _Nullable)beacon;
- (void)readBattery:(mBeacon * _Nullable)beacon :(void (^ _Nonnull)(NSDictionary<NSString *, NSString *> * _Nonnull))completionHandler;
- (void)readFirmwareInfo:(mBeacon * _Nullable)beacon :(void (^ _Nonnull)(NSDictionary<NSString *, NSString *> * _Nonnull))completionHandler;
- (void)updateDataLog:(mBeacon * _Nullable)beacon :(NSString * _Nonnull)userID :(NSString * _Nonnull)beaconID :(void (^ _Nonnull)(enum UploadDataStatus))completionHandler;
- (void)enableBootLoader:(mBeacon * _Nullable)beacon completeHandler:(void (^ _Nullable)(enum BootloaderState))handler;
- (void)performDFU:(NSURL * _Nonnull)aFileURL;
@end

typedef SWIFT_ENUM(NSInteger, ScanState, closed) {
  ScanStateScanning = 0,
  ScanStateSuccess = 1,
  ScanStateFailed = 2,
};

typedef SWIFT_ENUM(NSInteger, ConnectState, closed) {
  ConnectStateTimeout = 0,
  ConnectStateConnected = 1,
  ConnectStateDisconnected = 2,
  ConnectStateConnectFailed = 3,
  ConnectStateDisconnectFailed = 4,
};

typedef SWIFT_ENUM(NSInteger, LoginState, closed) {
  LoginStateSuccess = 0,
  LoginStateFailed = 1,
  LoginStateTimeout = 2,
};

typedef SWIFT_ENUM(NSInteger, BootloaderState, closed) {
  BootloaderStateEnable = 0,
  BootloaderStateDisable = 1,
};

typedef SWIFT_ENUM(NSInteger, ActivateState, closed) {
  ActivateStateSuccess = 0,
  ActivateStateConnectFailed = 1,
  ActivateStateLoginFailed = 2,
  ActivateStateChangePwFailed = 3,
  ActivateStateUploadFailed = 4,
  ActivateStateDisconnectFailed = 5,
  ActivateStateFailed = 6,
  ActivateStateException = 7,
  ActivateStateExixt = 8,
  ActivateStateTimeout = 9,
};

typedef SWIFT_ENUM(NSInteger, ChangePasswordState, closed) {
  ChangePasswordStateSuccess = 0,
  ChangePasswordStateFailed = 1,
  ChangePasswordStateTimeout = 2,
};

typedef SWIFT_ENUM(NSInteger, BeaconCommand, closed) {
  BeaconCommandIdle = 0,
  BeaconCommandConnect = 1,
  BeaconCommandLogin = 2,
  BeaconCommandChangePW = 3,
  BeaconCommandActivate = 4,
  BeaconCommandBuzzer = 5,
  BeaconCommandRecordRead = 6,
  BeaconCommandRecordLogStatus = 7,
  BeaconCommandStartRecordLog = 8,
  BeaconCommandReadBattery = 9,
  BeaconCommandReadVersionInfo = 10,
  BeaconCommandReadUTCTime = 11,
  BeaconCommandAdjustTime = 12,
  BeaconCommandGetLastRecordPos = 13,
  BeaconCommandSetStartPos = 14,
  BeaconCommandBurstLoad = 15,
  BeaconCommandBurstLoadStop = 16,
  BeaconCommandUploadDataLog = 17,
  BeaconCommandEnableBootLoader = 18,
  BeaconCommandOtaConnect = 19,
};

typedef SWIFT_ENUM(NSInteger, ActivatedStepState, closed) {
  ActivatedStepStateIdle = 0,
  ActivatedStepStateConnect = 1,
  ActivatedStepStateLogin1 = 2,
  ActivatedStepStateLogin2 = 3,
  ActivatedStepStateReadfirmware = 4,
  ActivatedStepStateOta = 5,
  ActivatedStepStateChangepw1 = 6,
  ActivatedStepStateChangepw2 = 7,
  ActivatedStepStateReadseed = 8,
  ActivatedStepStateUpload = 9,
  ActivatedStepStateAdjustTime = 10,
  ActivatedStepStateStartRecord = 11,
  ActivatedStepStateDisconnect = 12,
  ActivatedStepStateFinished = 13,
};

typedef SWIFT_ENUM(NSInteger, UploadDataStatus, closed) {
  UploadDataStatusSuccess = 0,
  UploadDataStatusFailed = 1,
  UploadDataStatusNoNewData = 2,
};


@interface BeaconAPI (SWIFT_EXTENSION(BLESDK)) <DFUProgressDelegate>
- (void)dfuProgressDidChangeFor:(NSInteger)part outOf:(NSInteger)totalParts to:(NSInteger)progress currentSpeedBytesPerSecond:(double)currentSpeedBytesPerSecond avgSpeedBytesPerSecond:(double)avgSpeedBytesPerSecond;
@end


@interface BeaconAPI (SWIFT_EXTENSION(BLESDK)) <LoggerDelegate>
- (void)logWith:(enum LogLevel)level message:(NSString * _Nonnull)message;
@end


@interface BeaconAPI (SWIFT_EXTENSION(BLESDK)) <DFUServiceDelegate>
- (void)dfuStateDidChangeTo:(enum DFUState)state;
- (void)dfuError:(enum DFUError)error didOccurWithMessage:(NSString * _Nonnull)message;
@end

@class CBPeripheral;
@class CBService;
@class CBCharacteristic;

@interface BeaconAPI (SWIFT_EXTENSION(BLESDK)) <CBPeripheralDelegate>
- (void)peripheral:(CBPeripheral * _Nonnull)peripheral didDiscoverServices:(NSError * _Nullable)error;
- (void)peripheral:(CBPeripheral * _Nonnull)peripheral didDiscoverCharacteristicsForService:(CBService * _Nonnull)service error:(NSError * _Nullable)error;
- (void)peripheral:(CBPeripheral * _Nonnull)peripheral didUpdateValueForCharacteristic:(CBCharacteristic * _Nonnull)characteristic error:(NSError * _Nullable)error;
@end

@class CBCentralManager;
@class NSNumber;

@interface BeaconAPI (SWIFT_EXTENSION(BLESDK)) <CBCentralManagerDelegate>
- (void)centralManagerDidUpdateState:(CBCentralManager * _Nonnull)central;
- (void)centralManager:(CBCentralManager * _Nonnull)central didDiscoverPeripheral:(CBPeripheral * _Nonnull)peripheral advertisementData:(NSDictionary<NSString *, id> * _Nonnull)advertisementData RSSI:(NSNumber * _Nonnull)RSSI;
- (void)centralManager:(CBCentralManager * _Nonnull)central didConnectPeripheral:(CBPeripheral * _Nonnull)peripheral;
- (void)centralManager:(CBCentralManager * _Nonnull)central didFailToConnectPeripheral:(CBPeripheral * _Nonnull)peripheral error:(NSError * _Nullable)error;
- (void)centralManager:(CBCentralManager * _Nonnull)central didDisconnectPeripheral:(CBPeripheral * _Nonnull)peripheral error:(NSError * _Nullable)error;
@end

@class BeaconInfo;

@interface BeaconAPI (SWIFT_EXTENSION(BLESDK))
- (void)RegisterUserWithUserID:(NSString * _Nonnull)userId FireBaseKey:(NSString * _Nullable)firebaseKey completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
- (void)getUserDeviceListWithUserID:(NSString * _Nonnull)userId completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
- (void)checkBeaconExistWithBeaconID:(NSString * _Nonnull)beaconID completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
- (void)getBeaconInfoWithBeaconID:(NSString * _Nonnull)beaconID completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
- (void)setBeaconInfoWithBeaconInfo:(BeaconInfo * _Nonnull)beaconInfo completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
/// Bind user’s beacon device with userId and beaconId
/// precondition:
/// <em>userId</em>, <em>beaconId</em> and <em>name</em> should not be nil.
/// todo:
/// NONE
/// version:
/// 0.1
/// author:
/// Rusty
/// \param userId One User ID.
///
/// \param beaconId mBeacon’s macId.
///
/// \param name Beacon’s nickname.
///
/// \param handler Api Complete Handler.
///
///
/// returns:
/// Void
- (void)bindBeaconWithUserWithUserID:(NSString * _Nonnull)userId BeaconID:(NSString * _Nonnull)beaconId NickName:(NSString * _Nonnull)name completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
/// Unbind user’s beacon device with userId and beaconId
/// precondition:
/// <em>userId</em> and <em>beaconId</em> should not be nil.
/// todo:
/// NONE
/// version:
/// 0.1
/// author:
/// Rusty
/// \param userId One User ID.
///
/// \param beaconId mBeacon’s macId.
///
/// \param handler Api Complete Handler.
///
///
/// returns:
/// Void
- (void)unBindBeaconWithUserWithUserID:(NSString * _Nonnull)userId BeaconID:(NSString * _Nonnull)beaconId completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
/// Set user’s beacon device missing with userId and beaconId
/// precondition:
/// <em>userId</em> and <em>beaconId</em> should not be nil.
/// todo:
/// NONE
/// version:
/// 0.1
/// author:
/// Rusty
/// \param userId One User ID.
///
/// \param beaconId mBeacon’s macId.
///
/// \param handler Api Complete Handler.
///
///
/// returns:
/// Void
- (void)setBeaconMissingWithUserID:(NSString * _Nonnull)userId BeaconID:(NSString * _Nonnull)beaconId completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
/// Get beacon device missing List
/// precondition:
/// <em>userId</em> should not be nil.
/// todo:
/// NONE
/// version:
/// 0.1
/// author:
/// Rusty
/// \param userId One User ID.
///
/// \param handler Api Complete Handler.
///
///
/// returns:
/// Void
- (void)getBeaconMissingListWithUserID:(NSString * _Nonnull)userId completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
/// Report to server while finding the missing beacon device
/// precondition:
/// <em>beaconId</em>, <em>lat</em> and <em>lng</em> should not be nil.
/// todo:
/// NONE
/// version:
/// 0.1
/// author:
/// Rusty
/// \param beaconId mBeacon’s macId.
///
/// \param lat Latitude.
///
/// \param lng Longitude.
///
/// \param handler Api Complete Handler.
///
///
/// returns:
/// Void
- (void)setBeaconCollisionWithBeaconID:(NSString * _Nonnull)beaconId Latitude:(float)lat Longitude:(float)lng completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
/// Get beacon collision log
/// precondition:
/// <em>beaconId</em> should not be nil.
/// todo:
/// NONE
/// version:
/// 0.1
/// author:
/// Rusty
/// \param beaconId mBeacon’s macId.
///
/// \param handler Api Complete Handler.
///
///
/// returns:
/// Void
- (void)getBeaconCollisionLogWithBeaconID:(NSString * _Nonnull)beaconId completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
/// Cancel user’s beacon device missing with userId and beaconId
/// precondition:
/// <em>userId</em> and <em>beaconId</em> should not be nil.
/// todo:
/// NONE
/// version:
/// 0.1
/// author:
/// Rusty
/// \param userId One User ID.
///
/// \param beaconId mBeacon’s macId.
///
/// \param handler Api Complete Handler.
///
///
/// returns:
/// Void
- (void)cancelBeaconMissingWithUserID:(NSString * _Nonnull)userId BeaconID:(NSString * _Nonnull)beaconId completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
- (void)getDataByDateWithUserID:(NSString * _Nonnull)userId BeaconID:(NSString * _Nonnull)beaconId Date:(NSString * _Nonnull)date completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
- (void)getDataByMonthWithUserID:(NSString * _Nonnull)userId BeaconID:(NSString * _Nonnull)beaconId Month:(NSString * _Nonnull)date completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
- (void)getDataByYearWithUserID:(NSString * _Nonnull)userId BeaconID:(NSString * _Nonnull)beaconId Year:(NSString * _Nonnull)date completeHandler:(void (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))handler;
@end

enum BeaconAPI_DFUState : NSInteger;

SWIFT_PROTOCOL("_TtP6BLESDK17BeaconAPIDelegate_")
@protocol BeaconAPIDelegate
- (void)dfuProgressUpdateFor:(NSInteger)part outOf:(NSInteger)totalParts to:(NSInteger)progress currentSpeedBytesPerSecond:(double)currentSpeedBytesPerSecond avgSpeedBytesPerSecond:(double)avgSpeedBytesPerSecond;
- (void)dfuStatusUpdateTo:(enum BeaconAPI_DFUState)state;
@end

typedef SWIFT_ENUM(NSInteger, BeaconAPI_DFUState, closed) {
  BeaconAPI_DFUStateConnecting = 0,
  BeaconAPI_DFUStateStarting = 1,
  BeaconAPI_DFUStateEnablingDfuMode = 2,
  BeaconAPI_DFUStateUploading = 3,
  BeaconAPI_DFUStateValidating = 4,
  BeaconAPI_DFUStateDisconnecting = 5,
  BeaconAPI_DFUStateCompleted = 6,
  BeaconAPI_DFUStateAborted = 7,
};


SWIFT_CLASS("_TtC6BLESDK10BeaconInfo")
@interface BeaconInfo : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_DEPRECATED_MSG("-init is unavailable");
- (void)updateInfoWithBeaconID:(NSString * _Nonnull)beaconId PW1:(NSString * _Nonnull)pw1 PW2:(NSString * _Nonnull)pw2 PwSeed:(NSString * _Nonnull)seed Brocast:(NSString * _Nonnull)brocast MacInfo:(NSString * _Nonnull)macInfo ExtraInfo:(NSString * _Nonnull)extra;
- (NSDictionary<NSString *, id> * _Nonnull)getPostFormat SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC6BLESDK13Notifications")
@interface Notifications : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly) NSNotificationName _Nonnull POST_NOTIFICATION_DISCONNECT;)
+ (NSNotificationName _Nonnull)POST_NOTIFICATION_DISCONNECT SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
