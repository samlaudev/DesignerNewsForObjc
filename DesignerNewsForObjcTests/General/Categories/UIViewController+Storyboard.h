//
//  UIViewController+Storyboard.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/30/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Storyboard)

+ (id)loadViewControllerWithIdentifier:(NSString*)identifier storyBoardName:(NSString*)storyboardName;
+ (id)loadViewControllerWithIdentifierForMainStoryboard:(NSString *)identifier;

@end
