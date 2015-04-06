//
//  StoryViewController.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/27/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryViewModel.h"

@interface StoryViewController : UITableViewController

@property (strong, nonatomic, readonly) StoryViewModel* viewModel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *loginBarButton;

@end
