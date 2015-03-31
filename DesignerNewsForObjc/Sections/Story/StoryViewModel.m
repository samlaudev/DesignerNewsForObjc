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
@property (assign, nonatomic, getter=isLoading) BOOL loading;

@end

@implementation StoryViewModel

- (instancetype)initWithCellIdentifier:(NSString*)cellIdentifier configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock;
{
    self = [super init];
    if (!self)
        return nil;
    _dataSource = [[ArrayDataSource alloc] initWithItems:@[] cellIdentifier:cellIdentifier configureCellBlock:configureCellBlock];
    // Data binding
    RAC(self.dataSource, items) = [self loadStoriesForSection:@"" page:1];
    RAC(self, storiesArray) = RACObserve(self.dataSource, items);

    return self;
}

- (RACSignal*)loadStoriesForSection:(NSString*)section page:(NSInteger)page
{
    return [[[[StoryClient storiesForSection:section page:page] map:^id(NSDictionary* JSONData) {
        self.active = NO;
        return [MTLJSONAdapter modelsOfClass:Story.class fromJSONArray:JSONData[@"stories"] error:nil];
    }] logError] catchTo:[RACSignal empty]];
}

- (void)loadStoriesWithType:(StoryType)storyType updateUIBlock:(UpdateUIBlock)updateUIBlock;
{
    self.active = YES;
    NSString* section = @"";
    NSString* title = @"";
    if (storyType == StoryTypeTop) {
        title = @"Top Stories";
    }
    else if (storyType == StoryTypeRecent) {
        title = @"Recent Stories";
        section = @"recent";
    }
    [[self loadStoriesForSection:section page:1] subscribeNext:^(id x) {
        updateUIBlock(title);
    }];
}

@end
