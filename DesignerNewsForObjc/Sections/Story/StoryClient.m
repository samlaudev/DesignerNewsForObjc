//
//  StoryClient.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/29/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "StoryClient.h"

@implementation StoryClient

+ (RACSubject*)storiesForSection:(NSString*)section page:(NSInteger)page
{
    RACSubject* signal = [RACSubject subject];

    NSDictionary* parameters = @{
        @"page" : [NSString stringWithFormat:@"%ld", (long)page],
        @"client_id" : clientID
    };

    [[AFHTTPSessionManager manager] GET:[DesignerNewsURL stroiesURLString] parameters:parameters success:^(NSURLSessionDataTask* task, id responseObject) {
                NSLog(@"url string = %@", task.currentRequest.URL);
                [signal sendNext:responseObject];
                [signal sendCompleted];
    } failure:^(NSURLSessionDataTask* task, NSError* error) {
                NSLog(@"url string = %@", task.currentRequest.URL);
                [signal sendError:error];
    }];

    return signal;
}

+ (RACSubject*)upvoteStoryWithStoryId:(NSInteger)storyId token:(NSString*)token
{
    RACSubject* signal = [RACSubject subject];

    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@", token] forHTTPHeaderField:@"Authorization"];
    [manager POST:[DesignerNewsURL storyUpvoteWithId:storyId] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [signal sendNext:@YES];
        [signal sendCompleted];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [signal sendError:error];
    }];

    return signal;
}

@end
