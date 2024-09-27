//
//  InitializeSDKViewController.h
//  Unity3DTestbed
//
//
//

#import <UIKit/UIKit.h>
#import <UnityAds/UnityAds.h>

NS_ASSUME_NONNULL_BEGIN

@interface InitializeSDKViewController : UIViewController<UnityAdsInitializationDelegate, UnityAdsLoadDelegate, UnityAdsShowDelegate>

@property (assign, nonatomic) BOOL testMode;

@end

NS_ASSUME_NONNULL_END
