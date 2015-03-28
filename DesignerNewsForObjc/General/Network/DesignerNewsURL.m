//
//  DesignerNewsURL.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/28/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "DesignerNewsURL.h"

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
