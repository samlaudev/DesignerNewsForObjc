//
//  LoginViewController.m
//  DesignerNewsForObjc
//
//  Created by Sam Lau on 3/31/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "LoginViewController.h"
#import "DesignerNewsForObjc-Swift.h"
#import "LoginClient.h"

@interface LoginViewController ()

@property (strong, nonatomic) LoginViewModel* viewModel;

@end

@implementation LoginViewController

#pragma mark - View controller lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // bind with view model
    [self bindViewModel];
    // text field notification
    [self textFieldStartEndEditing];
}

- (void)bindViewModel
{
    self.closeButton.rac_command = [self closeButtonDidTouchCommand];
    self.loginButton.rac_command = self.viewModel.loginButtonCommand;
    RAC(self.viewModel, email) = self.emailTextField.rac_textSignal;
    RAC(self.viewModel, password) = self.passwordTextField.rac_textSignal;
    [RACObserve(self.viewModel, active) subscribeNext:^(id x) {
        if ([x boolValue]) {
            [self.view showLoading];
        }else {
            [self.view hideLoading];
        }
    }];
}

#pragma mark - Lazy initialization
- (LoginViewModel*)viewModel
{
    if (!_viewModel) {
        _viewModel = [[LoginViewModel alloc] init];
        @weakify(self)
        _viewModel.dismissBlock = ^() {
            @strongify(self)
            [self dismissViewControllerAnimated:YES completion:nil];
            [self reloadStoryBlock];
        };
    }

    return _viewModel;
}

#pragma mark - Custom RACComand
- (RACCommand*)closeButtonDidTouchCommand
{
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal * (id input) {
        // Setup animation
        self.dialogView.animation = @"zoomOut";
        [self.dialogView animate];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        return [RACSignal empty];
    }];
}

#pragma mark - Text Field notification
- (void)textFieldStartEndEditing
{
    // Respond to when email text start and end editing
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextFieldTextDidBeginEditingNotification object:self.emailTextField] subscribeNext:^(id x) {
        [self.emailImageView animate];
        self.emailImageView.image = [UIImage imageNamed:@"icon-mail-active"];
        self.emailTextField.background = [UIImage imageNamed:@"input-outline-active"];
    }];

    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextFieldTextDidEndEditingNotification object:self.emailTextField] subscribeNext:^(id x) {
        self.emailTextField.background = [UIImage imageNamed:@"input-outline"];
        self.emailImageView.image = [UIImage imageNamed:@"icon-mail"];
    }];

    // Respond to when password text start and end editing
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextFieldTextDidBeginEditingNotification object:self.passwordTextField] subscribeNext:^(id x) {
        [self.passwordImageView animate];
        self.passwordTextField.background = [UIImage imageNamed:@"input-outline-active"];
        self.passwordImageView.image = [UIImage imageNamed:@"icon-password-active"];
    }];

    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextFieldTextDidEndEditingNotification object:self.passwordTextField] subscribeNext:^(id x) {
        self.passwordTextField.background = [UIImage imageNamed:@"input-outline"];
        self.passwordImageView.image = [UIImage imageNamed:@"icon-password"];
    }];
}

@end
