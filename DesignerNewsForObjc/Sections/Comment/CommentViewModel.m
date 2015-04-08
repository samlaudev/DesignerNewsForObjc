//
//  CommentViewModel.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/8/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "CommentViewModel.h"

@interface CommentViewModel ()

@property (strong, nonatomic) Story* story;

@end

@implementation CommentViewModel

- (instancetype)initWithStory:(Story*)story
{
    self = [super init];
    if (!self) {
        return self;
    }
    
    _story = story;

    return self;
}

@end
