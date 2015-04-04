//
//  LoginClient.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/3/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

@interface LoginClient : NSObject

+ (RACSignal *)loginWithUsername:(NSString *)username password:(NSString *)password;

@end
