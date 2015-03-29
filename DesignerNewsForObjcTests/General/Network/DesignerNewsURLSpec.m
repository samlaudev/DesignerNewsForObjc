//
//  DesignerNewsURLSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/28/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "DesignerNewsURL.h"

SPEC_BEGIN(DesignerNewsURLSpec)

describe(@"DesignerNewsURL", ^{
    
    context(@"when login", ^{
        it(@"should return the login url string", ^{
            NSString *expect = [NSString stringWithFormat:@"%@/oauth/token", baseURL];
            [[[DesignerNewsURL loginURLString] should] equal:expect];
        });
    });
    
    context(@"when get stories", ^{
        it(@"should return the stories url string", ^{
            NSString *expect = [NSString stringWithFormat:@"%@/api/v1/stories", baseURL];
            [[[DesignerNewsURL stroiesURLString] should] equal:expect];
        });
    });
    
    context(@"when get storie by id", ^{
        it(@"should return story url string by id", ^{
            NSString *expect = [NSString stringWithFormat:@"%@/api/v1/stories/1", baseURL];
            [[[DesignerNewsURL storyIdURLStringWithId:1] should] equal:expect];
        });
    });
    
    context(@"when upvote story by id", ^{
        it(@"should return story upvote url string", ^{
            NSString *expect = [NSString stringWithFormat:@"%@/api/v1/stories/1/upvote", baseURL];
            [[[DesignerNewsURL storyUpvoteWithId:1] should] equal:expect];
        });
    });
    
    context(@"when reply story by id", ^{
        it(@"should return story reply url string", ^{
            NSString *expect = [NSString stringWithFormat:@"%@/api/v1/stories/1/reply", baseURL];
            [[[DesignerNewsURL storyReplyWithId:1] should] equal:expect];
        });
    });
    
    context(@"when upvote comment by id", ^{
        it(@"should return comment upvote url string", ^{
            NSString *expect = [NSString stringWithFormat:@"%@/api/v1/comments/1/upvote", baseURL];
            [[[DesignerNewsURL commentUpvoteWithId:1] should] equal:expect];
        });
    });
    
    context(@"when reply comment by id", ^{
        it(@"should return comment reply url string ", ^{
            NSString *expect = [NSString stringWithFormat:@"%@/api/v1/comments/1/reply", baseURL];
            [[[DesignerNewsURL commentReplyWithId:1] should] equal:expect];
        });
    });
});

SPEC_END
