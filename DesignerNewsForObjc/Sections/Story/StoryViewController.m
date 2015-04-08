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
#import "LocalStore.h"

@interface StoryViewController () <MenuViewControllerDelegate, StoryTableViewCellDelegate>

@property (strong, nonatomic) StoryViewModel* viewModel;
@property (strong, nonatomic) RACCommand* refreshControlCommand;

@end

@implementation StoryViewController

#pragma mark - Lazy initialization
- (StoryViewModel*)viewModel
{
    if (!_viewModel) {
        _viewModel = [[StoryViewModel alloc] initWithCellIdentifier:@"StoryCell" configureCellBlock:^(StoryTableViewCell* cell, Story* item) {
            cell.delegate = self;
            [cell configureCellForStory:item];
        }];
        _viewModel.isFirstLogin = YES;
    }

    return _viewModel;
}

- (RACCommand*)refreshControlCommand
{
    if (!_refreshControlCommand) {
        _refreshControlCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * (id input) {
            NSString *section = [self.navigationItem.title isEqualToString:@""] ? @"" : @"recent";
            [[self.viewModel loadStoriesForSection:section page:1] subscribeNext:^(id x) {
                [self.refreshControl endRefreshing];
                [self.tableView reloadData];
            }];
            
            return [RACSignal empty];
        }];
    }

    return _refreshControlCommand;
}

#pragma mark - View controller lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // dynamic height for cell
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
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
    // when user pull down, refresh story
    self.refreshControl.rac_command = self.refreshControlCommand;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    if (self.viewModel.isFirstLogin) {
        self.viewModel.active = YES;
        self.viewModel.isFirstLogin = NO;
    }else {
        self.viewModel.active = NO;
    }
    
}

#pragma mark - Prepare for segue
- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"MenuSegue"]) {
        MenuViewController* destViewController = (MenuViewController*)segue.destinationViewController;
        destViewController.delegate = self;
    }
    else if ([segue.identifier isEqualToString:@"LoginSegue"]) {
        LoginViewController* destViewController = (LoginViewController*)segue.destinationViewController;
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

#pragma mark - StoryTableViewCell delegate
- (void)storyTableViewCellDidTouchUpvoteWithCell:(StoryTableViewCell*)cell sender:(SpringButton*)sender
{
    if ([LocalStore isHasLogin]) { // user has login
        NSInteger row = [self.tableView indexPathForCell:cell].row;
        Story* story = self.viewModel.storiesArray[row];
        // animate button
        if (![LocalStore isUpvoteStory:story.storyId]) {
            [sender animate];
        }
        // upvote story with id
        [[StoryClient upvoteStoryWithStoryId:story.storyId token:[LocalStore getToken]] subscribeNext:^(id x){

        }];
        // save story id
        [LocalStore saveUpvoteStory:story.storyId];
        // update story cell
        [cell configureCellForStory:story];
    }
    else { // user hasn't login yet;
        [self performSegueWithIdentifier:@"LoginSegue" sender:self];
    }
}

- (void)storyTableViewCellDidTouchCommentWithCell:(StoryTableViewCell*)cell sender:(id)sender
{
    [self performSegueWithIdentifier:@"CommentSegue" sender:self];
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

- (void)menuViewControllerDidTouchLogout:(MenuViewController*)controller
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
