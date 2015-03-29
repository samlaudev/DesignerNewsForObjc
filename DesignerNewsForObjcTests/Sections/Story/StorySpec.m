//
//  StorySpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/29/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "Story.h"
#import "TestHelper.h"

SPEC_BEGIN(StorySpec)

describe(@"Story", ^{
   context(@"when read json data and convert to story model", ^{
       NSDictionary *JSONData = [TestHelper JSONDataFromFileName:@"stories_response"];
       __block NSArray *storys = [MTLJSONAdapter modelsOfClass:Story.class fromJSONArray:JSONData[@"stories"] error:nil];
       
       it(@"should have some data", ^{
           [[storys[0] shouldNot] beNil];
       });
       
       it(@"should match some properties", ^{
           Story *story = storys[0];
           [[theValue(story.commentCount) should] equal:theValue(4)];
           [[theValue(story.upvoteCount) should] equal:theValue(17)];
       });
   });
});

SPEC_END
