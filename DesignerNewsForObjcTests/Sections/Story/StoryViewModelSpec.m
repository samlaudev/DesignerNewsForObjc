//
//  StoryViewModelSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/30/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "StoryViewModel.h"

SPEC_BEGIN(StoryViewModelSpec)

describe(@"StoryViewModel", ^{
    // Initialize view model
    __block StoryViewModel *viewModel = nil;
    beforeEach(^{
        viewModel = [[StoryViewModel alloc] initWithCellIdentifier:@"StoryCell" configureCellBlock:^(id cell, id item) {

        }];
    });
    afterEach(^{
        viewModel = nil;
    });

    context(@"when created", ^{
        it(@"should not be nil", ^{
            [[viewModel shouldNot] beNil];
        });
       
        it(@"should have data source's items count greater than 0", ^{
            [[theValue(viewModel.dataSource.items.count) shouldNotEventually] beGreaterThan:theValue(0)];
        });
        
        it(@"should have stories's count greater than 0", ^{
            [[theValue(viewModel.storiesArray.count) shouldNotEventually] beGreaterThan:theValue(0)];
        });
    });
});

SPEC_END
