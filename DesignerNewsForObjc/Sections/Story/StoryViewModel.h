//
//  StoryViewModel.h
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/28/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "RVMViewModel.h"
#import "ArrayDataSource.h"

@interface StoryViewModel : RVMViewModel

- (instancetype)initWithArrayDataSource:(ArrayDataSource*)dataSource;

@property (strong, nonatomic, readonly) ArrayDataSource *dataSource;

@end
