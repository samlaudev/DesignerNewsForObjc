//
//  StoryTableViewCell.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/30/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "StoryTableViewCell.h"
#import "DesignerNewsForObjc-Swift.h"
#import "StoryClient.h"
#import "LocalStore.h"

@implementation StoryTableViewCell

- (void)awakeFromNib
{
    _upvoteButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * (id input) {
        [self.delegate storyTableViewCellDidTouchUpvoteWithCell:self sender:_upvoteButton];
        
        return [RACSignal empty];
    }];

    _commentButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * (id input) {
        [self.delegate storyTableViewCellDidTouchCommentWithCell:self sender:_commentButton];

        return [RACSignal empty];
    }];
}

- (void)configureCellForStory:(Story*)story
{
    self.badgeImageView.image = story.badge;
    self.titleLabel.text = story.title;
    self.timeLabel.text = story.time;
    [self.userAvatarImageView setURL:[NSURL URLWithString:story.userAvatar] placeholderImage:[UIImage imageNamed:@"content-avatar-default"]];
    self.authorLabel.text = story.author;
    [self.upvoteButton setTitle:[NSString stringWithFormat:@"%ld", story.upvoteCount] forState:UIControlStateNormal];
    [self.commentButton setTitle:[NSString stringWithFormat:@"%ld", story.commentCount] forState:UIControlStateNormal];

    if ([LocalStore isUpvoteStory:story.storyId]) {
        [self.upvoteButton setImage:[UIImage imageNamed:@"icon-upvote-active"] forState:UIControlStateNormal];
        [self.upvoteButton setTitle:[NSString stringWithFormat:@"%ld", story.upvoteCount + 1] forState:UIControlStateNormal];
    }
    else {
        [self.upvoteButton setImage:[UIImage imageNamed:@"icon-upvote"] forState:UIControlStateNormal];
        [self.upvoteButton setTitle:[NSString stringWithFormat:@"%ld", story.upvoteCount] forState:UIControlStateNormal];
    }
}

@end
