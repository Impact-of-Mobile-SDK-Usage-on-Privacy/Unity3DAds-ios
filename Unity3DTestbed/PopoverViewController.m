//
//  PopoverViewController.m
//  Unity3DTestbed
//
//  
//

#import "PopoverViewController.h"
#import "Storage.h"

@implementation PopoverContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *onloadLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 200, 30)];
    onloadLabel.text = [NSString stringWithFormat:@"On Load %@", self.storage.onload ? @"YES" : @"NO"];
    
    // Create labels to display the values
    UILabel *consentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 30)];
    consentLabel.text = [NSString stringWithFormat:@"Consent %@", self.storage.consent ? @"YES" : @"NO"];
    
    UILabel *idfaLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
    idfaLabel.text = self.storage.idfa;
    
    UILabel *testmodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 140, 200, 30)];
    testmodeLabel.text = [NSString stringWithFormat:@"TestMode %@", self.storage.testmode ? @"YES" : @"NO"];
    
    // Add labels to the view
    [self.view addSubview:consentLabel];
    [self.view addSubview:onloadLabel];
    [self.view addSubview:idfaLabel];
    [self.view addSubview:testmodeLabel];
}

@end




