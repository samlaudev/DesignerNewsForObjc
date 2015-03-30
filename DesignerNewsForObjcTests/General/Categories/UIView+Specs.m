
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//

#import "UIView+Specs.h"

@implementation UIView (Specs)

- (UIButton*)specsFindButtonWithTitle:(NSString*)title
{
    NSPredicate* buttonPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary* bindings) {
        if ([evaluatedObject isKindOfClass:[UIButton class]]) {
            if ([[evaluatedObject currentTitle] isEqualToString:title]) {
                return YES;
            }
        }
        return NO;
    }];

    NSArray* allMatches = [self traverseChildrenWithPredicate:buttonPredicate];
    return [allMatches firstObject];
}

- (UIButton*)specsFindButtonWithTag:(NSInteger)tag;
{
    NSPredicate* buttonPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary* bindings) {
        if ([evaluatedObject isKindOfClass:[UIButton class]]) {
            if ([evaluatedObject tag] == tag) {
                return YES;
            }
        }
        return NO;
    }];

    NSArray* allMatches = [self traverseChildrenWithPredicate:buttonPredicate];
    return [allMatches firstObject];
}

- (UITextField*)specsFindTextFieldWithPlaceholder:(NSString*)placeholder
{
    NSPredicate* textFieldPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary* bindings) {
        if ([evaluatedObject isKindOfClass:[UITextField class]]) {
            if ([[evaluatedObject placeholder] isEqualToString:placeholder]) {
                return YES;
            }
        }
        return NO;
    }];

    NSArray* allMatches = [self traverseChildrenWithPredicate:textFieldPredicate];
    return [allMatches firstObject];
}

- (UILabel*)specsFindLabelWithText:(NSString*)text
{
    NSPredicate* labelPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary* bindings) {
        if ([evaluatedObject isKindOfClass:[UILabel class]]) {
            if ([[evaluatedObject text] isEqualToString:text]) {
                return YES;
            }
        }
        return NO;
    }];

    NSArray* allMatches = [self traverseChildrenWithPredicate:labelPredicate];
    return [allMatches firstObject];
}

#pragma mark -

- (NSArray*)traverseChildrenWithPredicate:(NSPredicate*)predicate
{
    return [[self subviews] filteredArrayUsingPredicate:predicate];
}

@end
