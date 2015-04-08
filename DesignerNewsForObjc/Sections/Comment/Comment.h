//
//  Comment.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/8/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>

@interface Comment : MTLModel <MTLJSONSerializing>

@property (assign, nonatomic) NSInteger commentId;
@property (strong, nonatomic) NSString* userAvatar;
@property (strong, nonatomic) NSString* author;
@property (strong, nonatomic) NSString* time;
@property (assign, nonatomic) NSInteger upvoteCount;
@property (strong, nonatomic) NSString *commentBody;

@end
