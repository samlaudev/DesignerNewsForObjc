//
//  MenuViewController.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/30/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "MenuViewController.h"
#import "DesignerNewsForObjc-Swift.h"
#import "LocalStore.h"
#import <ReactiveCocoa.h>

@interface MenuViewController ()

// UI properties
@property (weak, nonatomic) IBOutlet DesignableView* dialogView;
@property (strong, nonatomic) RACCommand* closeButtonCommand;
@property (strong, nonatomic) RACCommand* topStoriesButtonCommand;
@property (strong, nonatomic) RACCommand* recentButtonCommand;
@property (strong, nonatomic) RACCommand* learnButtonCommand;
@property (strong, nonatomic) RACCommand* logoutButtonCommand;

@end

@implementation MenuViewController

#pragma mark - View controller lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Respond to close button action
    self.closeButton.rac_command = self.closeButtonCommand;
    // Respond to top stories button action
    self.topStoriesButton.rac_command = self.topStoriesButtonCommand;
    // Respond to recent stories button action
    self.recentButton.rac_command = self.recentButtonCommand;
    // Respond to learn butotn action
    self.learnButton.rac_command = self.learnButtonCommand;
    // Respond to logout button action
    self.logoutButton.rac_command = self.logoutButtonCommand;
}

#pragma mark - Respond to action
- (RACCommand*)logoutButtonCommand
{
    if (!_logoutButtonCommand) {
        _logoutButtonCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * (id input) {
            if ([LocalStore isHasLogin]) {
                [LocalStore removeToken];
            }
            [self.closeButton.rac_command execute:nil];

            return [RACSignal empty];
        }];
    }

    return _logoutButtonCommand;
}

- (RACCommand*)learnButtonCommand
{
    if (!_learnButtonCommand) {
        _learnButtonCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * (id input) {
            [self performSegueWithIdentifier:@"LearnSegue" sender:self];
            
            return [RACSignal empty];
        }];
    }

    return _learnButtonCommand;
}

- (RACCommand*)recentButtonCommand
{
    if (!_recentButtonCommand) {
        _recentButtonCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * (id input) {
            // Dismiss view controller
            [self.closeButtonCommand execute:nil];
            [self.delegate menuViewControllerDidTouchRecentStories:self];
            
            return [RACSignal empty];
        }];
    };

    return _recentButtonCommand;
}

- (RACCommand*)closeButtonCommand
{
    if (!_closeButtonCommand) {
        _closeButtonCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * (id input) {
            // Dismiss animate
            self.dialogView.animation = @"fall";
            [self.dialogView animate];
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
            return [RACSignal empty];
        }];
    }

    return _closeButtonCommand;
}

- (RACCommand*)topStoriesButtonCommand
{
    if (!_topStoriesButtonCommand) {
        _topStoriesButtonCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * (id input) {
            [self.closeButtonCommand execute:nil];
            [self.delegate menuViewControllerDidTouchTopStories:self];

            return [RACSignal empty];
        }];
    }

    return _topStoriesButtonCommand;
}

@end
