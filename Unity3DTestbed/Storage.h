#import <Foundation/Foundation.h>

@interface Storage : NSObject

@property bool consent;
@property bool onload;
@property (nonatomic, strong) NSString *idfa;
@property bool testmode;
@property (nonatomic, strong) NSString *gameId;

+ (instancetype)sharedStorage;

@end
