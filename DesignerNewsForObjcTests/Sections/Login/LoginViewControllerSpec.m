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
#import <ReactiveCocoa.h>
#import "DesignerNewsForObjc-Swift.h"

SPEC_BEGIN(LoginViewControllerSpec)

describe(@"LoginViewController", ^{
    __block LoginViewController *controller;
    
    beforeEach(^{
        controller = [UIViewController loadViewControllerWithIdentifierForMainStoryboard:@"LoginViewController"];
        [controller view];
    });
    
    afterEach(^{
        controller = nil;
    });
    
    describe(@"Email Text Field", ^{
        context(@"when touch text field", ^{
            it(@"should not be nil", ^{
                [[controller.emailTextField shouldNot] beNil];
            });
        
            it(@"should change background image and icon", ^{
                
            });
        });
    });

});

SPEC_END
