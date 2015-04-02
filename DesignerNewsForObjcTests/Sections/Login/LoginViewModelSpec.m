//
//  LoginViewModelSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/2/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LoginViewModel.h"

SPEC_BEGIN(LoginViewModelSpec)

describe(@"LoginViewModel", ^{
    // Initialize
    __block LoginViewModel *viewModel;
    
    beforeEach(^{
        viewModel = [[LoginViewModel alloc] init];
    });
    
    afterEach(^{
        viewModel = nil;
    });

    context(@"when email and password is valid", ^{
        it(@"should get valid signal", ^{
            viewModel.email = @"liuyaozhu13hao@163.com";
            viewModel.password = @"123456";
            
            __block BOOL result;
           
            [[viewModel checkEmailPasswordSignal] subscribeNext:^(id x) {
                result = [x boolValue];
            } completed:^{
                [[theValue(result) should] beYes];
            }];
        });
    });
    
    context(@"when email is valid, but password is invalid", ^{
        it(@"should get invalid signal", ^{
            viewModel.email = @"liuyaozhu13hao@163.com";
            viewModel.password = @"1";
            
            __block BOOL result;
            
            [[viewModel checkEmailPasswordSignal] subscribeNext:^(id x) {
                result = [x boolValue];
            } completed:^{
                [[theValue(result) shouldNot] beYes];
            }];
        });
    });
    
    context(@"when password is valid, but email is invalid", ^{
        it(@"should get invalid signal", ^{
            viewModel.email = @"liuyaozhu";
            viewModel.password = @"123456";
            
            __block BOOL result;
            [[viewModel checkEmailPasswordSignal] subscribeNext:^(id x) {
                result = [x boolValue];
            } completed:^{
                [[theValue(result) shouldNot] beYes];
            }];
        });
    });
});

SPEC_END
