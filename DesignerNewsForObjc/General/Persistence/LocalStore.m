//
//  LocalStore.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/6/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "LocalStore.h"
#import <ReactiveCocoa.h>

NSString* const tokenKey = @"tokenKey";

@interface LocalStore ()

@end

@implementation LocalStore

#pragma mark - Operate token
+ (void)saveToken:(NSString*)token
{
    [[NSUserDefaults standardUserDefaults] setValue:token forKey:tokenKey];
}

+ (NSString*)getToken
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:tokenKey];
}

+ (BOOL)isHasLogin
{
    return [LocalStore getToken] != nil ? YES : NO;
}

+ (void)removeToken
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:tokenKey];
}

#pragma mark - Operate upvote
+ (void)saveUpvoteStory:(NSInteger)storyId
{
    NSArray* array = [[NSUserDefaults standardUserDefaults] arrayForKey:@"upvoteStoriesKey"] ? [[NSUserDefaults standardUserDefaults] arrayForKey:@"upvoteStoriesKey"]: @[];
    if (![array containsObject:@(storyId)]) {
        NSArray* concatenated = [[array.rac_sequence concat:@[ @(storyId) ].rac_sequence] array];
        [[NSUserDefaults standardUserDefaults] setObject:concatenated forKey:@"upvoteStoriesKey"];
    }
}

+ (BOOL)isUpvoteStory:(NSInteger)storyId
{
    NSArray* array = [[NSUserDefaults standardUserDefaults] arrayForKey:@"upvoteStoriesKey"];
    return [array containsObject:@(storyId)];
}

@end
