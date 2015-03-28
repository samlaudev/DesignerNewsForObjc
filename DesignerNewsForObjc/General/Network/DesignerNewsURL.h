//
//  DesignerNewsURL.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/28/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString * const baseURL = @"https://api-news.layervault.com";
NSString * const clientID = @"750ab22aac78be1c6d4bbe584f0e3477064f646720f327c5464bc127100a1a6d";
NSString * const clientSecret = @"53e3822c49287190768e009a8f8e55d09041c5bf26d0ef982693f215c72d87da";

@interface DesignerNewsURL : NSObject

+ (NSString *)loginURLString;
+ (NSString *)stroiesURLString;
+ (NSString *)storyIdURLStringWithId:(NSInteger)storyId;
+ (NSString *)storyUpvoteWithId:(NSInteger)storyId;
+ (NSString *)storyReplyWithId:(NSInteger)storyId;
+ (NSString *)commentUpvoteWithId:(NSInteger)commentId;
+ (NSString *)commentReplyWithId:(NSInteger)commentId;

@end
