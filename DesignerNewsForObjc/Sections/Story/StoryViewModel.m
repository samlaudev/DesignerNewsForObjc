//
//  StoryViewModel.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/28/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "StoryViewModel.h"

@implementation StoryViewModel

- (instancetype)initWithArrayDataSource:(ArrayDataSource*)dataSource
{
    self = [super init];
    if (!self) return nil;
    
    _dataSource = dataSource;
    
    return self;
}

@end
