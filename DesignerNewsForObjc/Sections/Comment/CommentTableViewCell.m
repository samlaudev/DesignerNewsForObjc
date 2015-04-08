//
//  CommentTableViewCell.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/8/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "CommentTableViewCell.h"
#import "DesignerNewsForObjc-Swift.h"

@implementation CommentTableViewCell

#pragma mark - Initialize
- (void)awakeFromNib
{
}

#pragma mark - Update UI
- (void)configureCellForComment:(Comment*)comment;
{
    [self.avatarImageView setURL:[NSURL URLWithString:comment.userAvatar] placeholderImage:[UIImage imageNamed:@"content-avatar-default"]];
    self.authorLabel.text = comment.author;
    self.timeLabel.text = comment.time;
    [self.upvoteButton setTitle:[NSString stringWithFormat:@"%ld", comment.upvoteCount] forState:UIControlStateNormal];
    self.commentTextView.text = comment.commentBody;
}

@end
