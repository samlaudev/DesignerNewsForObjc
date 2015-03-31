//
//  LoginViewController.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/31/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DesignableView;

@interface LoginViewController : UIViewController

// UI properties
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet DesignableView *dialogView;

@end
