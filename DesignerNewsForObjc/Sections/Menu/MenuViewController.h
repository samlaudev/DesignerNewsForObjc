//
//  MenuViewController.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/30/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuViewController;

@protocol MenuViewControllerDelegate <NSObject>

- (void)menuViewControllerDidTouchTopStories:(MenuViewController *)controller;

@end

@interface MenuViewController : UIViewController

// UI properties
@property (weak, nonatomic) IBOutlet UIButton *topStoriesButton;
@property (weak, nonatomic) IBOutlet UIButton *recentButton;
@property (weak, nonatomic) IBOutlet UIButton *learnButton;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
// Delegate
@property (weak, nonatomic) id<MenuViewControllerDelegate> delegate;

// Respond to action
- (IBAction)closeButtonDidTouch:(id)sender;

@end
