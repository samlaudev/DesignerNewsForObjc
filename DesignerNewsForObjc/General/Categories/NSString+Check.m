//
//  NSString+Check.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/2/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "NSString+Check.h"

@implementation NSString (EmailCheck)

- (BOOL)isValidEmail
{
    NSString* emailPattern =
        @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
        @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
        @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
        @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
        @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
        @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
        @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    NSError* error = nil;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:emailPattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult* match = [regex firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
    return match != nil;
}

@end

@implementation NSString (PasswordCheck)

- (BOOL)isValidPassword
{
    return self.length >= 6;
}

@end