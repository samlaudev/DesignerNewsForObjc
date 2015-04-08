//
//  CommentTableViewCell.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/8/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"

@class AsyncImageView;
@class SpringButton;
@class AutoTextView;

@interface CommentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet AsyncImageView* avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel* authorLabel;
@property (weak, nonatomic) IBOutlet UILabel* timeLabel;
@property (weak, nonatomic) IBOutlet SpringButton* upvoteButton;
@property (weak, nonatomic) IBOutlet SpringButton* replyButton;
@property (weak, nonatomic) IBOutlet AutoTextView* commentTextView;

- (void)configureCellForComment:(Comment*)comment;

@end
