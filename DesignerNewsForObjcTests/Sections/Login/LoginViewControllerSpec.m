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
        });
        
        context(@"when text field's text is hello", ^{
            it(@"shoud euqal view model's email property", ^{
                controller.emailTextField.text = @"hello";
                [controller.emailTextField sendActionsForControlEvents:UIControlEventEditingChanged];
                [[controller.viewModel.email should] equal:@"hello"];
            });
        });
    });
    
    describe(@"Password Text Field", ^{
        context(@"when touch text field", ^{
            it(@"should not be nil", ^{
                [[controller.passwordTextField shouldNot] beNil];
            });
        });
        
        context(@"when text field' text is hello", ^{
            it(@"should equal view model's password property", ^{
                controller.passwordTextField.text = @"hello";
                [controller.passwordTextField sendActionsForControlEvents:UIControlEventEditingChanged];
                
                [[controller.viewModel.password should] equal:@"hello"];
            });
        });
    });

    describe(@"Login Button", ^{
        context(@"when load view", ^{
            it(@"should be not nil", ^{
                [[controller.loginButton shouldNot] beNil];
            });
            
            it(@"should have rac command that not be nil", ^{
                [[controller.loginButton.rac_command shouldNot] beNil];
            });
        });
    });
});

SPEC_END
