//
//  LocalStore.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/6/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "LocalStore.h"

NSString* const tokenKey = @"tokenKey";

@interface LocalStore ()

@end

@implementation LocalStore

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

@end
