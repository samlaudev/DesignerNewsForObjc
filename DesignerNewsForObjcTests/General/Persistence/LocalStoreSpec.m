//
//  LocalStoreSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/6/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LocalStore.h"

SPEC_BEGIN(LocalStoreSpec)

describe(@"LocalStore", ^{

    context(@"when save the token", ^{
        it(@"should have the token that can't be empty", ^{
            [LocalStore saveToken:@"123456"];
            [[[LocalStore getToken] should] equal:@"123456"];
        });
        
        it(@"should has login", ^{
            [LocalStore saveToken:@"123456"];
            [[theValue([LocalStore isHasLogin]) should] beYes];
        });
    });
    
    context(@"when remove token", ^{
        it(@"should be empty", ^{
            [LocalStore removeToken];
            [[[LocalStore getToken] should] beNil];
        });
    });
    
    context(@"when save story upvote id", ^{
        it(@"should has upvoted", ^{
            [LocalStore saveUpvoteStory:12345];
            
            [[theValue([LocalStore isUpvoteStory:12345]) should] beYes];
        });
    });

});

SPEC_END
