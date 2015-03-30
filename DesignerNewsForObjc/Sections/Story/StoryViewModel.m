//
//  StoryViewModel.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/28/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "StoryViewModel.h"

@interface StoryViewModel ()

@property (strong, nonatomic) NSArray* storiesArray;

@end

@implementation StoryViewModel

- (instancetype)initWithCellIdentifier:(NSString*)cellIdentifier configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock;
{
    self = [super init];
    if (!self)
        return nil;
    _dataSource = [[ArrayDataSource alloc] initWithItems:@[] cellIdentifier:cellIdentifier configureCellBlock:configureCellBlock];
    // Data binding
    RAC(self.dataSource, items) = [[StoryClient storiesForSection:@"" page:1] map:^id(NSDictionary* JSONData) {
            return [MTLJSONAdapter modelsOfClass:Story.class fromJSONArray:JSONData[@"stories"] error:nil];
    }];
    RAC(self, storiesArray) = RACObserve(self.dataSource, items);
    

    return self;
}

@end
