//
//  Story.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/28/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "Story.h"
#import "DesignerNewsForObjc-Swift.h"

@implementation Story

#pragma mark - Properties name mapping
+ (NSDictionary*)JSONKeyPathsByPropertyKey
{
    return @{
        @"badge" : @"badge",
        @"title" : @"title",
        @"time" : @"created_at",
        @"userAvatar" : @"user_portrait_url",
        @"author" : @"user_display_name",
        @"upvoteCount" : @"vote_count",
        @"commentCount" : @"comment_count",
        @"comment" : @"comment"
    };
}

#pragma mark - Properties type transform
+ (NSValueTransformer*)badgeJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^id(NSString* badgeName) {
        NSString *imageName = [NSString stringWithFormat:@"badge-%@", badgeName];
        return [UIImage imageNamed:imageName];
    }];
}

+ (NSValueTransformer*)timeJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^id(NSString* createAt) {
        return [Misc timeAgoSinceDate:[Misc dateFromString:createAt format:@"yyyy-MM-dd'T'HH:mm:ssZ"] numericDates:YES];
    }];
}

@end
