//
//  InitialStateViewController.m
//  Unity3DTestbed
//
//
//

#import "InitialStateViewController.h"
#import <UnityAds/UnityAds.h>
#import "Storage.h"

@interface InitialStateViewController ()

@end

@implementation InitialStateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"On Load is %d", [[Storage sharedStorage] onload]);
    if ([[Storage sharedStorage] onload]) {
        // Create UIAlertController
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Create obj"
                                                                                     message:@"There is no create object without initialization."
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            
        // Create UIAlertAction
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // Handle the OK button click (if needed)
        }];
            
        // Add the UIAlertAction to the UIAlertController
        [alertController addAction:okAction];
        
        // Present the alert
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (IBAction)createObj:(id)sender {
    // Create UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Create obj"
                                                                             message:@"There is no create object without initialization."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
    // Create UIAlertAction
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Handle the OK button click (if needed)
    }];
        
    // Add the UIAlertAction to the UIAlertController
    [alertController addAction:okAction];
    
    // Present the alert
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
