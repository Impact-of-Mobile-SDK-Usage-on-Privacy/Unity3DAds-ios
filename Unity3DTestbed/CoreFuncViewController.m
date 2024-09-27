//
//  CoreFuncViewController.m
//  Unity3DTestbed
//
// 
//

#import "CoreFuncViewController.h"
#import <UnityAds/UnityAds.h>
#import "Storage.h"

@interface CoreFuncViewController () <UADSBannerViewDelegate>

// This is the Ad Unit or Placement that will display banner ads:
@property (strong) NSString* placementId;
// This banner view object will be placed at the top of the screen:
@property (strong, nonatomic) UADSBannerView *topBannerView;
// This banner view object will be placed at the bottom of the screen:
@property (strong, nonatomic) UADSBannerView *bottomBannerView;

@end

@implementation CoreFuncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[Storage sharedStorage] onload])
    {
        NSLog(@"Show banner at loading");
        //self.placementId = @"My_Banner";
        self.placementId = @"Banner_iOS";
        [self loadTopBanner];
    }
}

- (IBAction)showBannerViaButton:(id)sender {
        NSLog(@"Show banner via button");
        self.placementId = @"Banner_iOS";
        [self loadTopBanner];
}


// Example method for creating and loading the top banner view object:
- (void)loadTopBanner{
    // Instantiate a banner view object with the Ad Unit ID and size:
    self.topBannerView = [[UADSBannerView alloc] initWithPlacementId: _placementId size: CGSizeMake(320, 50)];
    
    self.topBannerView.backgroundColor = UIColor.whiteColor;
    
    // Set the banner delegate for event callbacks:
    self.topBannerView.delegate = self;
    // Add the banner view object to the view hierarchy:
    [self addBannerViewToTopView:self.topBannerView];
    NSLog(@"Until here no problem");
    // Load ad content to the banner view object:
    [_topBannerView load];
}

// Example method for creating and loading the bottom banner view object:
- (void)loadBottomBanner{
    self.bottomBannerView = [[UADSBannerView alloc] initWithPlacementId: _placementId size: CGSizeMake(320, 50)];
    self.bottomBannerView.delegate = self;
    [self addBannerViewToBottomView:self.bottomBannerView];
    [_bottomBannerView load];
}

// Example method for discarding the top banner view object (for example, if there's no fill):
- (void)unLoadTopBanner{
    // Remove the banner view object from the view hierarchy:
    [self.topBannerView removeFromSuperview];
    // Set it to nil:
    _topBannerView = nil;
}

// Example method for discarding the bottom banner view object:
- (void)unLoadBottomBanner{
    [self.bottomBannerView removeFromSuperview];
    _bottomBannerView = nil;
}

// Example method for placing the top banner view object:
- (void)addBannerViewToTopView:(UIView *)bannerView {
    bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:bannerView];
    [self.view addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:bannerView
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.topLayoutGuide
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1
                                                             constant:0],
                               [NSLayoutConstraint constraintWithItem:bannerView
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0]
                               ]];
}

// Example method for placing the bottom banner view object:
- (void)addBannerViewToBottomView: (UIView *)bannerView {
    bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:bannerView];
    [self.view addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:bannerView
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.bottomLayoutGuide
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1
                                                             constant:0],
                               [NSLayoutConstraint constraintWithItem:bannerView
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0]
                               ]];
}

// Implement the delegate methods:
#pragma mark : UADSBannerViewDelegate

- (void)bannerViewDidShow: (UADSBannerView *)bannerView {
    // Called when the banner view object is shown.
    NSLog(@"Banner shown for Ad Unit or Placement: %@", bannerView.placementId);
}

- (void)bannerViewDidLoad:(UADSBannerView *)bannerView {
    // Called when the banner view object finishes loading an ad.
    NSLog(@"Banner loaded for Ad Unit or Placement: %@", bannerView.placementId);
}
 
- (void)bannerViewDidClick:(UADSBannerView *)bannerView {
    // Called when the banner is clicked.
    NSLog(@"Banner was clicked for Ad Unit or Placement: %@", bannerView.placementId);
}
 
- (void)bannerViewDidLeaveApplication:(UADSBannerView *)bannerView {
    // Called when the banner links out of the application.
}
 
 
- (void)bannerViewDidError:(UADSBannerView *)bannerView error:(UADSBannerError *)error{
    // Called when an error occurs showing the banner view object.
    NSLog(@"Banner encountered an error for Ad Unit or Placement: %@ with error message %@", bannerView.placementId, [error localizedDescription]);
    // Note that the UADSBannerError can indicate no fill (refer to the API documentation).
}

@end
