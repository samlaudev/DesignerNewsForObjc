//
//  StoryViewControllerSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/30/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "StoryViewController.h"
#import "StoryViewModel.h"

SPEC_BEGIN(StoryViewControllerSpec)

describe(@"StoryViewController", ^{
    // Initialize StoryViewController
    __block StoryViewController *controller = nil;
    
    beforeEach(^{
        controller = [[StoryViewController alloc] init];
    });
    
    afterEach(^{
        controller = nil;
    });

    context(@"when load view", ^{
        __block UIView *view = nil;
        
        beforeEach(^{
            view = controller.view;
        });
        
        it(@"should have data source that equal table view data source", ^{
            [[controller.viewModel.dataSource should] equal:controller.tableView.dataSource];
        });
    });

});

SPEC_END
