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
#import "UIViewController+Storyboard.h"
#import "StoryTableViewCell.h"
#import "Story.h"

SPEC_BEGIN(StoryViewControllerSpec)

describe(@"StoryViewController", ^{
    // Initialize StoryViewController
    __block StoryViewController *controller = nil;
    
    beforeEach(^{
        controller = [StoryViewController loadViewControllerWithIdentifierForMainStoryboard:@"StoryViewController"];
        [controller view];
    });
    
    afterEach(^{
        controller = nil;
    });

    context(@"when load view", ^{
        it(@"should have data source that equal table view data source", ^{
            [[controller.viewModel.dataSource should] equal:controller.tableView.dataSource];
        });
    });
    
    context(@"when user pull down", ^{
        it(@"should fetch stories", ^{
            [[controller.viewModel should] receive:@selector(loadStoriesForSection:page:)];
            [controller.refreshControl.rac_command execute:nil];
        });
    });
});

SPEC_END
