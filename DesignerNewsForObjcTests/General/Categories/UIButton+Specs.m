//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import "UIButton+Specs.h"


@implementation UIButton (Specs)

- (void)specsSimulateTap {
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@end
