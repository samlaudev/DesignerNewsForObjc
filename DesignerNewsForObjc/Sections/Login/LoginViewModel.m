//
//  LoginViewModel.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/2/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "LoginViewModel.h"
#import "NSString+Check.h"
#import "LoginClient.h"
#import "LocalStore.h"

@interface LoginViewModel ()

@property (strong, nonatomic) RACCommand* loginButtonCommand;

@end

@implementation LoginViewModel
#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (!self) {
        return self;
    }

    return self;
}

#pragma mark - Lazy initialization
- (RACCommand*)loginButtonCommand
{
    if (!_loginButtonCommand) {
        _loginButtonCommand = [[RACCommand alloc] initWithEnabled:[self checkEmailPasswordSignal] signalBlock:^RACSignal * (id input) {
            self.active = YES;
            
            return [[LoginClient loginWithUsername:self.email password:self.password] doNext:^(NSString *token) {
                self.active = NO;
                // Save the token
                [LocalStore saveToken:token];
                // Dismiss view controller and fetch data, reload
                self.dismissBlock();
            }];
        }];
    }

    return _loginButtonCommand;
}

- (RACSignal*)checkEmailPasswordSignal
{
    RACSignal* emailSignal = RACObserve(self, email);
    RACSignal* passwordSignal = RACObserve(self, password);

    return [RACSignal combineLatest:@[ emailSignal, passwordSignal ] reduce:^(NSString* email, NSString* password) {
        BOOL result = [email isValidEmail] && [password isValidPassword];
        
        return @(result);
    }];
}

@end
