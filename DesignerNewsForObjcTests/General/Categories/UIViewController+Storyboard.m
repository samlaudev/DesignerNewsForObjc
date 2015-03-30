//
//  UIViewController+Storyboard.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/30/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "UIViewController+Storyboard.h"

@implementation UIViewController (Storyboard)

+ (id)loadViewControllerWithIdentifier:(NSString*)identifier storyBoardName:(NSString*)storyboardName
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}


+ (id)loadViewControllerWithIdentifierForMainStoryboard:(NSString *)identifier{
    return [UIViewController loadViewControllerWithIdentifier:identifier storyBoardName:@"Main"];
}

@end
