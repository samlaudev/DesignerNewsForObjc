//
//  LoginViewController.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/31/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "LoginViewController.h"
#import "DesignerNewsForObjc-Swift.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark - View controller lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Respond to action
- (IBAction)loginButtonDidTouch:(id)sender
{
    // Setup animation
    self.dialogView.animation = @"zoomOut";
    [self.dialogView animate];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
