//
//  LoginViewControllerSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/31/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LoginViewController.h"
#import "UIViewController+Storyboard.h"
#import "UIButton+Specs.h"

SPEC_BEGIN(LoginViewControllerSpec)

describe(@"LoginViewController", ^{
    __block LoginViewController *controller;
    
    beforeEach(^{
        controller = [UIViewController loadViewControllerWithIdentifierForMainStoryboard:@"LoginViewController"];
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
            it(@"should dismiss login view controller", ^{
                [[controller should] receive:@selector(dismissViewControllerAnimated:completion:)];
                
                [controller.closeButton specsSimulateTap];
            });
        });
    });
});

SPEC_END
