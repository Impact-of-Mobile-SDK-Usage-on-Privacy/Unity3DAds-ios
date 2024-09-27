//
//  InitializeSDKViewController.m
//  Unity3DTestbed
//
//
//

#import "InitializeSDKViewController.h"
#import "Storage.h"

@interface InitializeSDKViewController ()

@end

@implementation InitializeSDKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[Storage sharedStorage] onload]) {
        NSLog(@"On load true");
        [[InitializeSDKViewController alloc] initSDK];
        dispatch_async(dispatch_get_main_queue(), ^{
            // Create UIAlertController
            UIAlertController *alertController2 = [UIAlertController alertControllerWithTitle:@"Init SDK"
                                                                                     message:@"Initialized SDK"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            
            // Create UIAlertAction
            UIAlertAction *okAction2 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                // Handle the OK button click (if needed)
            }];
            
            // Add the UIAlertAction to the UIAlertController
            [alertController2 addAction:okAction2];
            
            // Present the alert from the current view controller
            [self presentViewController:alertController2 animated:YES completion:nil];
        });
    }
}

- (IBAction)initializeViaButton:(id)sender {
    [[InitializeSDKViewController alloc] initSDK];
    dispatch_async(dispatch_get_main_queue(), ^{
        // Create UIAlertController
        UIAlertController *alertController2 = [UIAlertController alertControllerWithTitle:@"Init SDK"
                                                                                  message:@"Initialized SDK"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        // Create UIAlertAction
        UIAlertAction *okAction2 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // Handle the OK button click (if needed)
        }];
        
        // Add the UIAlertAction to the UIAlertController
        [alertController2 addAction:okAction2];
        
        // Present the alert from the current view controller
        [self presentViewController:alertController2 animated:YES completion:nil];
    });
}

- (void) initSDK {
    [UnityAds initialize:[[Storage sharedStorage] gameId] testMode:[[Storage sharedStorage] testmode] initializationDelegate:self];
}

// Implement initialization callbacks to handle success or failure:
#pragma mark : UnityAdsInitializationDelegate
- (void)initializationComplete {
    NSLog(@" - UnityAdsInitializationDelegate initializationComplete" );
    // Pre-load an ad when initialization succeeds, so it is ready to show:
    [UnityAds load:@"Interstitial_iOS" loadDelegate:self];
}
 
- (void)initializationFailed:(UnityAdsInitializationError)error withMessage:(NSString *)message {
    NSLog(@" - UnityAdsInitializationDelegate initializationFailed with message: %@", message );
}
 
// Implement load callbacks to handle success or failure after initialization:
#pragma mark: UnityAdsLoadDelegate
- (void)unityAdsAdLoaded:(NSString *)placementId {
    NSLog(@" - UnityAdsLoadDelegate unityAdsAdLoaded %@", placementId);
}
 
- (void)unityAdsAdFailedToLoad:(NSString *)placementId
                     withError:(UnityAdsLoadError)error
                   withMessage:(NSString *)message {
    NSLog(@" - UnityAdsLoadDelegate unityAdsAdFailedToLoad %@", placementId);
}


@end
