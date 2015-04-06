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
#import <ReactiveCocoa.h>
#import "LocalStore.h"

SPEC_BEGIN(MenuViewControllerSpec)

describe(@"MenuViewController", ^{
    // Initialize controller
    __block MenuViewController *controller;
    
    beforeEach(^{
        controller = [MenuViewController loadViewControllerWithIdentifierForMainStoryboard:@"MenuViewController"];

    });
    
    afterEach(^{
    });
    
    describe(@"Root View", ^{
        __block UIView *view;
        
        beforeEach(^{
            view = controller.view;
        });
        
        context(@"when click close button", ^{
            it(@"should dismiss menu view controller", ^{
                [[controller should] receive:@selector(dismissViewControllerAnimated:completion:)];
                [controller.closeButton.rac_command execute:nil];
            });
        });
        
        context(@"when click top stories button", ^{
            beforeEach(^{
                id delegate = [KWMock mockForProtocol:@protocol(MenuViewControllerDelegate)];
                [[delegate should] receive:@selector(menuViewControllerDidTouchTopStories:)];
                controller.delegate = delegate;
            });
            
            it(@"should dismiss menu view controller ", ^{
                [[controller should] receive:@selector(dismissViewControllerAnimated:completion:)];
                
                [controller.topStoriesButton.rac_command execute:nil];
            });
            
            it(@"should reload stories in story view controller", ^{
                id delegate = controller.delegate;
                [[delegate should] receive:@selector(menuViewControllerDidTouchTopStories:)];
                
                [controller.topStoriesButton.rac_command  execute:nil];
            });
        });
        
        context(@"when click recent stories button ", ^{
            beforeEach(^{
                id delegate = [KWMock mockForProtocol:@protocol(MenuViewControllerDelegate)];
                [[delegate should] receive:@selector(menuViewControllerDidTouchRecentStories:)];
                controller.delegate = delegate;
            });
            
            it(@"should dimiss menu view controller", ^{
                [[controller should] receive:@selector(dismissViewControllerAnimated:completion:)];
                [controller.recentButton.rac_command execute:nil];
            });
            
            it(@"should reload stories in story view controller", ^{
                id delegate = controller.delegate;
                [[delegate should] receive:@selector(menuViewControllerDidTouchRecentStories:)];
                
                [controller.recentButton.rac_command execute:nil];
            });
        });
        
        context(@"when click learn button", ^{
            it(@"should jump to learn view controller", ^{
                [[controller should] receive:@selector(performSegueWithIdentifier:sender:)];
                [controller.learnButton.rac_command execute:nil];
            });
        });
        
        context(@"when click logout button", ^{
            it(@"should remove token if user has login", ^{
                [[controller should] receive:@selector(dismissViewControllerAnimated:completion:)];
                
                [controller.logoutButton.rac_command execute:nil];
            });
        });

    });
});

SPEC_END
