//
//  StoryViewModel.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/28/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "RVMViewModel.h"
#import "ArrayDataSource.h"
#import "Story.h"
#import <ReactiveCocoa.h>
#import "StoryClient.h"
#import <Mantle.h>

@interface StoryViewModel : RVMViewModel

- (instancetype)initWithCellIdentifier:(NSString*)cellIdentifier configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock;

@property (strong, nonatomic, readonly) ArrayDataSource* dataSource;
@property (strong, nonatomic, readonly) NSArray* storiesArray;

- (RACSignal*)loadStoriesForSection:(NSString*)section page:(NSInteger)page;

@end
