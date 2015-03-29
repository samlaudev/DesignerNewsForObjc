//
//  TestHelper.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/29/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "TestHelper.h"

@implementation TestHelper

+ (NSDictionary*)JSONDataFromFileName:(NSString*)fileName
{
    // Search json file
    NSBundle *bundle = [NSBundle bundleForClass:self];
    NSString *resource = [bundle pathForResource:fileName ofType:@"json"];
    // Read data
    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:resource] options:0 error:nil];
}

@end
