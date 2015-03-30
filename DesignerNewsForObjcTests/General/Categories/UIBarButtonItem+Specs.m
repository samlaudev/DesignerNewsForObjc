//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import "UIBarButtonItem+Specs.h"


@implementation UIBarButtonItem (Specs)

- (void)specsSimulateTap {
    [self.target performSelector:self.action withObject:self];
}

@end
