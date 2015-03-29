//
//  DesignerNewsURL.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/28/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const baseURL;
extern NSString* const clientID;
extern NSString* const clientSecret;

@interface DesignerNewsURL : NSObject

+ (NSString*)loginURLString;
+ (NSString*)stroiesURLString;
+ (NSString*)storyIdURLStringWithId:(NSInteger)storyId;
+ (NSString*)storyUpvoteWithId:(NSInteger)storyId;
+ (NSString*)storyReplyWithId:(NSInteger)storyId;
+ (NSString*)commentUpvoteWithId:(NSInteger)commentId;
+ (NSString*)commentReplyWithId:(NSInteger)commentId;
@end
