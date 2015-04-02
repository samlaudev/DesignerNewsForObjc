//
//  LoginViewController.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/31/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "LoginViewModel.h"

@class DesignableView;
@class DesignableTextField;
@class SpringImageView;
@class DesignableButton;

@interface LoginViewController : UIViewController

// UI properties
@property (weak, nonatomic) IBOutlet UIButton* closeButton;
@property (weak, nonatomic) IBOutlet DesignableButton *loginButton;
@property (weak, nonatomic) IBOutlet DesignableView* dialogView;
@property (weak, nonatomic) IBOutlet DesignableTextField* emailTextField;
@property (weak, nonatomic) IBOutlet DesignableTextField* passwordTextField;
@property (weak, nonatomic) IBOutlet SpringImageView* emailImageView;
@property (weak, nonatomic) IBOutlet SpringImageView* passwordImageView;

@property (strong, nonatomic, readonly) LoginViewModel *viewModel;

@end
