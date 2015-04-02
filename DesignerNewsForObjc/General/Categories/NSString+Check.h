//
//  NSString+Check.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/2/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EmailCheck)

- (BOOL)isValidEmail;

@end

@interface NSString (PasswordCheck)

- (BOOL)isValidPassword;

@end
