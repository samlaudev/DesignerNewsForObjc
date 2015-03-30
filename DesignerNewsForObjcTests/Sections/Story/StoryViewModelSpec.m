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
        
        it(@"should have data source property", ^{
            [[viewModel.dataSource shouldNot] beNil];
        });
    });
});

SPEC_END
