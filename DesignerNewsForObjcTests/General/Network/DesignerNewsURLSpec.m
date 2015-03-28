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
            [[[DesignerNewsURL loginURLString] should] equal:@"https://api-news.layervault.com/oauth/token"];
        });
    });
    
    context(@"when get stories", ^{
        it(@"should return the stories url string", ^{
            [[[DesignerNewsURL stroiesURLString] should] equal:@"https://api-news.layervault.com/api/v1/stories"];
        });
    });
    
    context(@"when get storie by id", ^{
        it(@"should return story url string by id", ^{
            [[[DesignerNewsURL storyIdURLStringWithId:1] should] equal:@"https://api-news.layervault.com/api/v1/stories/1"];
        });
    });
    
    context(@"when upvote story by id", ^{
        it(@"should return story upvote url string", ^{
            [[[DesignerNewsURL storyUpvoteWithId:1] should] equal:@"https://api-news.layervault.com/api/v1/stories/1/upvote"];
        });
    });
    
    context(@"when reply story by id", ^{
        it(@"should return story reply url string", ^{
            [[[DesignerNewsURL storyReplyWithId:1] should] equal:@"https://api-news.layervault.com/api/v1/stories/1/reply"];
        });
    });
    
    context(@"when upvote comment by id", ^{
        it(@"should return comment upvote url string", ^{
            [[[DesignerNewsURL commentUpvoteWithId:1] should] equal:@"https://api-news.layervault.com/api/v1/comments/1/upvote"];
        });
    });
    
    context(@"when reply comment by id", ^{
        it(@"should return comment reply url string ", ^{
            [[[DesignerNewsURL commentReplyWithId:1] should] equal:@"https://api-news.layervault.com/api/v1/comments/1/reply"];
        });
    });
});

SPEC_END
