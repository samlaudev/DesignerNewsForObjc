//
//  StoryTableViewCell.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/30/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "StoryTableViewCell.h"
#import "DesignerNewsForObjc-Swift.h"

@implementation StoryTableViewCell

- (void)configureCellForStory:(Story*)story
{
    self.badgeImageView.image = story.badge;
    self.titleLabel.text = story.title;
    self.timeLabel.text = story.time;
    [self.userAvatarImageView setURL:[NSURL URLWithString:story.userAvatar] placeholderImage:[UIImage imageNamed:@"content-avatar-default"]];
    self.authorLabel.text = story.author;
    [self.upvoteButton setTitle:[NSString stringWithFormat:@"%ld", story.upvoteCount] forState:UIControlStateNormal];
    [self.commentButton setTitle:[NSString stringWithFormat:@"%ld", story.commentCount] forState:UIControlStateNormal];
}

@end
