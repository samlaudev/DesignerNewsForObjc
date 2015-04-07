//
//  StoryClientSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/29/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "StoryClient.h"
#import "LocalStore.h"

SPEC_BEGIN(StoryClientSpec)

describe(@"StoryClient", ^{
    
    context(@"when fecth stories with section and page from network", ^{
        it(@"should receive data within one second", ^{
            __block id fecthData = nil;
            
            RACSignal *signal = [StoryClient storiesForSection:@"" page:1];
            [signal subscribeNext:^(id x) {
                fecthData = x;
            } completed:^{
                [[fecthData shouldNot] beNil];
            }];
        });
    });
    
    context(@"when upvote story with id", ^{
        it(@"should upvote story successfully", ^{
            __block id result;
            
            RACSignal *signal = [StoryClient upvoteStoryWithStoryId:46826 token:@"4422ea7f05750e93a101cb77ff76dffd3d65d46ebf6ed5b94d211e5d9b3b80bc"];
            [signal subscribeNext:^(id x) {
                result = x;
            } error:^(NSError *error) {
                [[theValue([result boolValue]) should] beYes];
            } completed:^{
                [[theValue([result boolValue]) should] beYes];
            }];
        });
    });
});

SPEC_END
