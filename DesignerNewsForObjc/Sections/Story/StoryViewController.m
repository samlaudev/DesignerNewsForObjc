//
//  StoryViewController.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/27/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "StoryViewController.h"
#import "StoryViewModel.h"
#import "StoryTableViewCell.h"

@interface StoryViewController ()

@property (strong, nonatomic) StoryViewModel* viewModel;

@end

@implementation StoryViewController

#pragma mark - Lazy initialization
- (StoryViewModel*)viewModel
{
    if (!_viewModel) {
        _viewModel = [[StoryViewModel alloc] initWithCellIdentifier:@"StoryCell" configureCellBlock:^(StoryTableViewCell* cell, Story* item){
            [cell configureCellForStory:item];
        }];
    }

    return _viewModel;
}

#pragma mark - View controller lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // setup table view data source
    self.tableView.dataSource = self.viewModel.dataSource;
    // observe view model's stories property, when it update, table view should reload data
    @weakify(self)
        [RACObserve(self.viewModel, storiesArray) subscribeNext : ^(id x) {
        @strongify(self)
        [self.tableView reloadData];
        }];
}

@end
