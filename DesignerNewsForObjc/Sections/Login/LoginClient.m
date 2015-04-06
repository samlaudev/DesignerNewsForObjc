//
//  LoginClient.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/3/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "LoginClient.h"
#import <AFNetworking.h>
#import "DesignerNewsURL.h"

@implementation LoginClient

+ (RACSignal*)loginWithUsername:(NSString*)username password:(NSString*)password
{

    RACSubject* subject = [RACSubject subject];

    NSDictionary* parameters = @{
        @"grant_type" : @"password",
        @"username" : username,
        @"password" : password,
        @"client_id" : clientID,
        @"client_secret" : clientSecret,
    };

    [[AFHTTPSessionManager manager] POST:[DesignerNewsURL loginURLString] parameters:parameters success:^(NSURLSessionDataTask* task, id responseObject) {
        NSString *accessToken = responseObject[@"access_token"];
        [subject sendNext:accessToken];
        [subject sendCompleted];
    } failure:^(NSURLSessionDataTask* task, NSError* error) {
        [subject sendError:error];
    }];

    return [[subject logError] catchTo:[RACSignal empty]];
}

@end
