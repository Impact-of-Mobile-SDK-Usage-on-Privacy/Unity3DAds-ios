//
//  ViewController.m
//  Unity3DTestbed
//
// 
//

#import "ViewController.h"
#import "Storage.h"
#import "PopoverViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[Storage sharedStorage] setTestmode:false];
    
    // Create a button
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button setTitle:@"Show Popover" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(showPopover:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
}

- (IBAction)executeOnLoad:(id)sender {
    [[Storage sharedStorage] setOnload:true];
    NSLog(@"On Load: %d", [[Storage sharedStorage] onload]);
}

- (IBAction)giveConsent:(id)sender {
    [[Storage sharedStorage] setConsent:true];
    NSLog(@"Consent: %d", [[Storage sharedStorage] consent]);
}

- (IBAction)showConfig:(id)sender {
    // Create the content view controller for your popover
    PopoverContentViewController *contentViewController = [[PopoverContentViewController alloc] init];
        
    // Set the Storage object with values
    contentViewController.storage = [Storage sharedStorage];
        
    // Create the popover presentation controller
    UIPopoverPresentationController *presentationController = contentViewController.popoverPresentationController;
    presentationController.sourceView = sender;
    //presentationController.sourceRect = sender.bounds;
    presentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    
    // Present the popover
    [self presentViewController:contentViewController animated:YES completion:nil];
}

@end
