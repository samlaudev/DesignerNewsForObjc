//
//  StoryTableViewCell.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/30/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Story.h"

@class SpringButton;
@class AsyncImageView;

@interface StoryTableViewCell : UITableViewCell

// UI properties
@property (weak, nonatomic) IBOutlet UIImageView* badgeImageView;
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UILabel* timeLabel;
@property (weak, nonatomic) IBOutlet AsyncImageView* userAvatarImageView;
@property (weak, nonatomic) IBOutlet UILabel* authorLabel;
@property (weak, nonatomic) IBOutlet SpringButton* upvoteButton;
@property (weak, nonatomic) IBOutlet SpringButton* commentButton;

// Configure methods
- (void)configureCellForStory:(Story*)story;

@end
