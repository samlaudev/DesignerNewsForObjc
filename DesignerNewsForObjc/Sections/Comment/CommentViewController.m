//
//  CommentViewController.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 4/8/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "CommentViewController.h"
#import "StoryTableViewCell.h"
#import "CommentTableViewCell.h"

@interface CommentViewController ()

@property (strong, nonatomic) CommentViewModel* viewModel;

@end

@implementation CommentViewController

#pragma mark - View controller lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // dynamic height
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 150;
    // setup table view data source
    self.tableView.dataSource = self;
}

#pragma mark - Override Setter
- (void)setViewModelWithStory:(Story*)story
{
    if (!_viewModel) {
        _viewModel = [[CommentViewModel alloc] initWithStory:story];
    }
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewModel.story.comments count] + 1;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSString *identifier = indexPath.row == 0 ? @"StoryCell" : @"CommentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if ([cell isKindOfClass:[StoryTableViewCell class]]) {
        [((StoryTableViewCell *)cell) configureCellForStory:self.viewModel.story];
    }else if ([cell isKindOfClass:[CommentTableViewCell class]]) {
        [((CommentTableViewCell *)cell) configureCellForComment:self.viewModel.story.comments[indexPath.row - 1]];
    }
    
    
    return cell;
}

@end
