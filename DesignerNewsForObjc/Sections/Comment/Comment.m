//
//  Comment.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/8/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "Comment.h"
#import "DesignerNewsForObjc-Swift.h"

@implementation Comment

#pragma mark - Map property name
+ (NSDictionary*)JSONKeyPathsByPropertyKey
{
    return @{
        @"commentId" : @"id",
        @"userAvatar" : @"user_portrait_url",
        @"author" : @"user_display_name",
        @"time" : @"created_at",
        @"upvoteCount" : @"vote_count",
        @"commentBody" : @"body",
    };
}

+ (NSValueTransformer*)timeJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^id(NSString* createAt) {
        return [Misc timeAgoSinceDate:[Misc dateFromString:createAt format:@"yyyy-MM-dd'T'HH:mm:ssZ"] numericDates:YES];
    }];
}

@end
