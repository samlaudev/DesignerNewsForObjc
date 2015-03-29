//
//  StoryClient.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/29/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>
#import <AFNetworking.h>
#import "DesignerNewsURL.h"

@interface StoryClient : NSObject

+ (RACSignal*)storiesForSection:(NSString *)section page:(NSInteger)page;

@end
