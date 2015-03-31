//
//  MenuViewController.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/30/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "MenuViewController.h"
#import "DesignerNewsForObjc-Swift.h"

@interface MenuViewController ()

// UI properties
@property (weak, nonatomic) IBOutlet DesignableView* dialogView;

@end

@implementation MenuViewController

#pragma mark - View controller lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Respond to action
- (IBAction)closeButtonDidTouch:(id)sender
{
    // Dismiss animate
    self.dialogView.animation = @"fall";
    [self.dialogView animate];

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)topStoriesButtonDidTouch:(id)sender
{
    // Close view controller
    [self closeButtonDidTouch:sender];
    [self.delegate menuViewControllerDidTouchTopStories:self];
}

- (IBAction)recentButtonDidTouch:(id)sender
{
    // Close view controller
    [self closeButtonDidTouch:sender];
    [self.delegate menuViewControllerDidTouchRecentStories:self];
}

- (IBAction)learnButtonDidTouch:(id)sender
{
    [self performSegueWithIdentifier:@"LearnSegue" sender:self];
}

- (IBAction)logoutButtonDidTouch:(id)sender
{
}

@end
