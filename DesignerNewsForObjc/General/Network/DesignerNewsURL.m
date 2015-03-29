//
//  DesignerNewsURL.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/28/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "DesignerNewsURL.h"

#ifndef TEST
NSString* const baseURL = @"https://api-news.layervault.com";
#else
NSString* const baseURL = @"http://localhost:12306";
#endif

NSString* const clientID = @"750ab22aac78be1c6d4bbe584f0e3477064f646720f327c5464bc127100a1a6d";
NSString* const clientSecret = @"53e3822c49287190768e009a8f8e55d09041c5bf26d0ef982693f215c72d87da";

@implementation DesignerNewsURL

+ (NSString*)loginURLString
{
    return [NSString stringWithFormat:@"%@/oauth/token", baseURL];
}

+ (NSString*)stroiesURLString
{
    return [NSString stringWithFormat:@"%@/api/v1/stories", baseURL];
}

+ (NSString*)storyIdURLStringWithId:(NSInteger)storyId
{
    return [NSString stringWithFormat:@"%@/api/v1/stories/%ld", baseURL, (long)storyId];
}

+ (NSString*)storyUpvoteWithId:(NSInteger)storyId
{
    return [NSString stringWithFormat:@"%@/api/v1/stories/%ld/upvote", baseURL, (long)storyId];
}

+ (NSString*)storyReplyWithId:(NSInteger)storyId
{
    return [NSString stringWithFormat:@"%@/api/v1/stories/%ld/reply", baseURL, (long)storyId];
}

+ (NSString*)commentUpvoteWithId:(NSInteger)commentId
{
    return [NSString stringWithFormat:@"%@/api/v1/comments/%ld/upvote", baseURL, (long)commentId];
}

+ (NSString*)commentReplyWithId:(NSInteger)commentId
{
    return [NSString stringWithFormat:@"%@/api/v1/comments/%ld/reply", baseURL, (long)commentId];
}

@end
