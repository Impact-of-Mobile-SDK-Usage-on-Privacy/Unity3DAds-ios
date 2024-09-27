//
//  Storage.m
//  Unity3DTestbed
//
//
//

#import "Storage.h"

@implementation Storage

@synthesize consent, onload, idfa, testmode;

+ (instancetype)sharedStorage {
    static Storage *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    sharedInstance.gameId = @"XXX";
    return sharedInstance;
}

@end
