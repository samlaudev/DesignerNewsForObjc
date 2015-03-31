//
//  LearnViewController.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/31/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LearnViewController : UIViewController

// UI properties
@property (weak, nonatomic) IBOutlet UIButton* closeButton;
@property (weak, nonatomic) IBOutlet UIButton *learnButton;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;

// Respond to action
- (IBAction)closeButtonDidTouch:(id)sender;
- (IBAction)learnButtonDidTouch:(id)sender;
- (IBAction)twitterButtonDidTouch:(id)sender;

- (void)openWebSiteWithURL:(NSString *)urlString;

@end
