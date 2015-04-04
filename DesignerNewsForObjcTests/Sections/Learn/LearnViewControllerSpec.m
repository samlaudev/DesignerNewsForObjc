//
//  LearnViewControllerSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/31/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LearnViewController.h"
#import "UIViewController+Storyboard.h"
#import "UIButton+Specs.h"

SPEC_BEGIN(LearnViewControllerSpec)

describe(@"LearnViewController", ^{
    __block LearnViewController *controller;
    
    beforeEach(^{
        controller = [UIViewController loadViewControllerWithIdentifierForMainStoryboard:@"LearnViewController"];
    });
    
    afterEach(^{
        controller = nil;
    });
    
    describe(@"Root View", ^{
        __block UIView *view;
        
        beforeEach(^{
            view = controller.view;
        });
        
        
        context(@"when click close button", ^{
            it(@"should dismiss view controller", ^{
                [[controller should] receive:@selector(dismissViewControllerAnimated:completion:)];
                
                [controller.closeButton specsSimulateTap];
            });
        });
        
        context(@"when click learn button", ^{
            it(@"should open website for url 'http://designcode.io/' ", ^{
                [[controller should] receive:@selector(openWebSiteWithURL:)];
                
                [controller.learnButton specsSimulateTap];
            });
        });
        
        context(@"when click twitter button", ^{
            it(@"should open website for url 'http://twitter.com/mengto'", ^{
                [[controller should] receive:@selector(openWebSiteWithURL:)];
                
                [controller.twitterButton specsSimulateTap];
            });
        });
    });
});

SPEC_END
