//
//  LearnViewController.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/31/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "LearnViewController.h"

@implementation LearnViewController

#pragma mark - View controller lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Respond to action
- (IBAction)closeButtonDidTouch:(id)sender {
    // dismiss view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)learnButtonDidTouch:(id)sender {
    [self openWebSiteWithURL:@"http://designcode.io/"];
}

- (IBAction)twitterButtonDidTouch:(id)sender {
    [self openWebSiteWithURL:@"http://twitter.com/mengto"];
}

#pragma mark - Helper methods
- (void)openWebSiteWithURL:(NSString *)urlString
{
    NSURL *websiteURL = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:websiteURL];
}

@end
