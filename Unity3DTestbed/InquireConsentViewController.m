//
//  InquireConsentViewController.m
//  Unity3DTestbed
//
//
//

#import "InquireConsentViewController.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/ASIdentifierManager.h>
#import <UnityAds/UnityAds.h>
#import "Storage.h"

@interface InquireConsentViewController ()

@end

@implementation InquireConsentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[Storage sharedStorage] onload]) {
        NSLog(@"On load true");
        [[InquireConsentViewController alloc] giveConsent];
        dispatch_async(dispatch_get_main_queue(), ^{
            // Create UIAlertController
            UIAlertController *alertController2 = [UIAlertController alertControllerWithTitle:@"Manual Consent"
                                                                                     message:@"You gave consent to gdpr."
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

- (IBAction)noConsent:(id)sender {
    [[InquireConsentViewController alloc] giveNoConsent];
    // Ensure this code is executed on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            // Create UIAlertController
            UIAlertController *alertController2 = [UIAlertController alertControllerWithTitle:@"Manual Refuse"
                                                                                      message:@"You refuse consent to gdpr."
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

- (IBAction)inquireConsent:(id)sender {
    [[InquireConsentViewController alloc] giveConsent];
    // Ensure this code is executed on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            // Create UIAlertController
            UIAlertController *alertController2 = [UIAlertController alertControllerWithTitle:@"Manual Consent"
                                                                                      message:@"You gave consent to gdpr."
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



- (void)giveConsent {
    NSLog(@"Manually set GDPR consent");
    // If the user opts in to targeted advertising:
    UADSMetaData *gdprConsentMetaData = [[UADSMetaData alloc] init];
    [gdprConsentMetaData set:@"gdpr.consent" value:@"YES"];
    [gdprConsentMetaData commit];
}

- (void)giveNoConsent {
    NSLog(@"Manually set GDPR consent");
    // If the user opts in to targeted advertising:
    UADSMetaData *gdprConsentMetaData = [[UADSMetaData alloc] init];
    [gdprConsentMetaData set:@"gdpr.consent" value:@"NO"];
    [gdprConsentMetaData commit];
}

@end
