//
//  StoryTableViewCell.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/30/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Story.h"
#import <ReactiveCocoa.h>

@class StoryTableViewCell;

@protocol StoryTableViewCellDelegate <NSObject>

- (void)storyTableViewCellDidTouchUpvoteWithCell:(StoryTableViewCell*)cell sender:(id)sender;
- (void)storyTableViewCellDidTouchCommentWithCell:(StoryTableViewCell*)cell sender:(id)sender;

@end

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
@property (weak, nonatomic) id <StoryTableViewCellDelegate> delegate;

// Configure methods
- (void)configureCellForStory:(Story*)story;

@end
