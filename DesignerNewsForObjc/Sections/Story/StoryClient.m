//
//  StoryClient.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/29/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "StoryClient.h"

@implementation StoryClient

+ (RACSignal*)storiesForSection:(NSString*)section page:(NSInteger)page
{
    return [[RACSignal createSignal:^RACDisposable * (id<RACSubscriber> subscriber) {
        NSDictionary *parameters = @{
            @"page":[NSString stringWithFormat:@"%ld", (long)page],
            @"client_id":clientID
        };
        
        [[AFHTTPSessionManager manager] GET:[DesignerNewsURL stroiesURLString] parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"url string = %@", task.currentRequest.URL);
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [subscriber sendError:error];
        }];

        return [RACDisposable disposableWithBlock:^{

        }];
    }] doError:^(NSError* error) {
        NSLog(@"%@", error);
    }];
}

@end
