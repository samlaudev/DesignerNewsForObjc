//
//  CommentViewModel.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/8/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "RVMViewModel.h"
#import "ArrayDataSource.h"
#import "Story.h"

@interface CommentViewModel : RVMViewModel

- (instancetype)initWithStory:(Story *)story;

@property (strong, nonatomic, readonly) Story* story;
@property (strong, nonatomic) NSArray* commentsArray;

@end
