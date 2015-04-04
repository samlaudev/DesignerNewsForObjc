//
//  LoginClientSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/3/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LoginClient.h"

SPEC_BEGIN(LoginClientSpec)

describe(@"LoginClient", ^{
    
    context(@"when user input correct username and password", ^{
        __block RACSignal *loginSignal;
        
        beforeEach(^{
            NSString *username = @"liuyaozhu13hao@163.com";
            NSString *password = @"freedom13";
            loginSignal = [LoginClient loginWithUsername:username password:password];
        });
        
        it(@"should return login signal that can't be nil", ^{
            [[loginSignal shouldNot] beNil];
        });
       
        it(@"should login successfully", ^{
            __block NSString *accessToken = nil;
            
            [loginSignal subscribeNext:^(NSString *x) {
                accessToken = x;
                NSLog(@"accessToken = %@", accessToken);
            }error:^(NSError *error) {
                [[accessToken shouldNot] beNil];
            } completed:^{
                [[accessToken shouldNot] beNil];
            } ];
        });
        
    });
});

SPEC_END
