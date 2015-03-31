//
//  StoryClientSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/29/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "StoryClient.h"

SPEC_BEGIN(StoryClientSpec)

describe(@"StoryClient", ^{
    
    context(@"when fecth stories with section and page from network", ^{
        it(@"should receive data within one second", ^{
            __block id fecthData = nil;
            
            RACSignal *signal = [StoryClient storiesForSection:@"" page:1];
            [signal subscribeNext:^(id x) {
                fecthData = x;
            }];
            
            [[expectFutureValue(fecthData) shouldEventuallyBeforeTimingOutAfter(2.0)] beNonNil];
        });
    });
});

SPEC_END
