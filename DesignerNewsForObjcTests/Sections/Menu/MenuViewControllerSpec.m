//
//  MenuViewControllerSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/30/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "MenuViewController.h"
#import "UIView+Specs.h"
#import "UIButton+Specs.h"
#import "UIViewController+Storyboard.h"

SPEC_BEGIN(MenuViewControllerSpec)

describe(@"MenuViewController", ^{
    // Initialize controller
    __block MenuViewController *controller;
    
    beforeEach(^{
        controller = [MenuViewController loadViewControllerWithIdentifierForMainStoryboard:@"MenuViewController"];
        id delegate = [KWMock mockForProtocol:@protocol(MenuViewControllerDelegate)];
        [[delegate should] receive:@selector(menuViewControllerDidTouchTopStories:)];
        controller.delegate = delegate;
    });
    
    afterEach(^{
    });
    
    describe(@"Root View", ^{
        __block UIView *view;
        
        beforeEach(^{
            view = controller.view;
        });
        
        context(@"when click top stories button", ^{
            it(@"should dismiss view controller and reload stories in story view controller", ^{
                [[controller should] receive:@selector(closeButtonDidTouch:)];
                
                [controller.topStoriesButton specsSimulateTap];
            });
            
            it(@"should reload stories in story view controller", ^{
                id delegate = controller.delegate;
                [[delegate should] receive:@selector(menuViewControllerDidTouchTopStories:)];

                [controller.topStoriesButton specsSimulateTap];
            });
        });

    });
});

SPEC_END
