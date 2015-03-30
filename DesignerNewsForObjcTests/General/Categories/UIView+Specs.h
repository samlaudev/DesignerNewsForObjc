//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIView (Specs)

- (UIButton *)specsFindButtonWithTitle:(NSString *)title;
- (UIButton *)specsFindButtonWithTag:(NSInteger)tag;
- (UITextField *)specsFindTextFieldWithPlaceholder:(NSString *)placeholder;
- (UILabel *)specsFindLabelWithText:(NSString *)text;

@end
