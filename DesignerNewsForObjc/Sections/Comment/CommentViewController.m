//
//  CommentViewController.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/8/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController ()

@property (strong, nonatomic) CommentViewModel *viewModel;

@end

@implementation CommentViewController

#pragma mark - View controller lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Lazy initialization
- (CommentViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[CommentViewModel alloc] init];
    }
    
    return _viewModel;
}

@end
