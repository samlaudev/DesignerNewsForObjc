//
//  CommentViewControllerSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/8/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "CommentViewController.h"
#import "Story.h"
#import "UIViewController+Storyboard.h"

SPEC_BEGIN(CommentViewControllerSpec)

describe(@"CommentViewController", ^{
    __block CommentViewController *controller;
    
    beforeEach(^{
        controller = [UIViewController loadViewControllerWithIdentifierForMainStoryboard:@"CommentViewController"];
        [controller setViewModelWithStory:[[Story alloc] init]];
        [controller view];
    });
    
    afterEach(^{
        controller = nil;
    });
    
    context(@"when load view", ^{
        it(@"should have table view's data source that cant be nil", ^{
            id dataSource = controller.tableView.dataSource;
            [[dataSource shouldNot] beNil];
        });
    });
});

SPEC_END
