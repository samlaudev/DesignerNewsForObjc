//
//  Story.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/28/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <Mantle.h>
#import <UIKit/UIKit.h>
#import "Comment.h"

@interface Story : MTLModel <MTLJSONSerializing>

@property (assign, nonatomic) NSInteger storyId;
@property (strong, nonatomic) UIImage* badge;
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* time;
@property (strong, nonatomic) NSString* userAvatar;
@property (strong, nonatomic) NSString* author;
@property (assign, nonatomic) NSInteger upvoteCount;
@property (assign, nonatomic) NSInteger commentCount;
@property (strong, nonatomic) NSString *comment;
@property (strong, nonatomic) NSArray *comments;

@end
