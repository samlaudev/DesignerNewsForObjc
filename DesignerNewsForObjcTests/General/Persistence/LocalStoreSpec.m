//
//  LocalStoreSpec.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/6/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LocalStore.h"


SPEC_BEGIN(LocalStoreSpec)

describe(@"LocalStore", ^{

    context(@"When save the token", ^{
        it(@"have the token that can't be empty", ^{
            [LocalStore saveToken:@"123456"];
            [[[LocalStore getToken] should] equal:@"123456"];
        });
    });
});

SPEC_END
