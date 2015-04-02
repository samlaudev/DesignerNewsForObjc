//
//  LoginViewModel.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/2/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "RVMViewModel.h"
#import <ReactiveCocoa.h>

@interface LoginViewModel : RVMViewModel

@property (strong, nonatomic, readonly) RACCommand *loginButtonCommand;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *password;

- (RACSignal*)checkEmailPasswordSignal;

@end
