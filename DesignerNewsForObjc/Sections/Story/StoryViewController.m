//
//  StoryViewController.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/27/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "StoryViewController.h"
#import "StoryViewModel.h"

@interface StoryViewController ()

@property (strong, nonatomic) StoryViewModel* viewModel;

@end

@implementation StoryViewController

#pragma mark - Lazy initialization
- (StoryViewModel*)viewModel
{
    if (!_viewModel) {
        ArrayDataSource* dataSouce = [[ArrayDataSource alloc] initWithItems:@[ @"1" ] cellIdentifier:@"StoryCell" configureCellBlock:^(id cell, id item){

        }];
        _viewModel = [[StoryViewModel alloc] initWithArrayDataSource:dataSouce];
    }

    return _viewModel;
}

#pragma mark - View controller lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // setup table view data source
    self.tableView.dataSource = self.viewModel.dataSource;
}

@end
