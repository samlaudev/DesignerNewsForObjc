//
//  StoryViewController.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/27/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "StoryViewController.h"
#import "StoryTableViewCell.h"
#import "MenuViewController.h"
#import "DesignerNewsForObjc-Swift.h"
#import "LoginViewController.h"

@interface StoryViewController () <MenuViewControllerDelegate>

@property (strong, nonatomic) StoryViewModel* viewModel;

@end

@implementation StoryViewController

#pragma mark - Lazy initialization
- (StoryViewModel*)viewModel
{
    if (!_viewModel) {
        _viewModel = [[StoryViewModel alloc] initWithCellIdentifier:@"StoryCell" configureCellBlock:^(StoryTableViewCell* cell, Story* item) {
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
    [RACObserve(self.viewModel, storiesArray) subscribeNext:^(id x) {
        [self.tableView reloadData];
    }];
    // show loading indicator
    [RACObserve(self.viewModel, active) subscribeNext:^(id loading) {
        if ([loading boolValue]) {
            [self.view showLoading];
        }else {
            [self.view hideLoading];
        }
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.viewModel.active = YES;
}

#pragma mark - Prepare for segue
- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"MenuSegue"]) {
        MenuViewController* destViewController = (MenuViewController*)segue.destinationViewController;
        destViewController.delegate = self;
    }else if ([segue.identifier isEqualToString:@"LoginSegue"]) {
        LoginViewController *destViewController = (LoginViewController*)segue.destinationViewController;
        destViewController.reloadStoryBlock = ^() {
            [self fetchStoriesForSection:@"" title:@"Top Stories"];
            self.loginBarButton.enabled = NO;
        };
    }
}

#pragma mark - Respond to action
- (IBAction)menuButtonDidTouch:(id)sender
{
    [self performSegueWithIdentifier:@"MenuSegue" sender:self];
}

#pragma mark - MenuViewController delegate
- (void)menuViewControllerDidTouchTopStories:(MenuViewController*)controller
{
    [self fetchStoriesForSection:@"" title:@"Top Stories"];
}

- (void)menuViewControllerDidTouchRecentStories:(MenuViewController*)controller
{
    [self fetchStoriesForSection:@"recent" title:@"Recent Stories"];
}

- (void)menuViewControllerDidTouchLogout:(MenuViewController *)controller
{
    self.loginBarButton.enabled = YES;
}

- (void)fetchStoriesForSection:(NSString*)section title:(NSString*)title
{
    // show indicator
    self.viewModel.active = YES;
    // change navigation item title name
    self.navigationItem.title = title;
    // fecth data and reload table view
    [[self.viewModel loadStoriesForSection:section page:1] subscribeNext:^(id x) {
        [self.tableView reloadData];
    }];
}

@end
