//
//  SignInVCViewController.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/11/17.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "SignInVCViewController.h"
#import "AppDelegate.h"

@interface SignInVCViewController ()<UITextFieldDelegate> {
    
    IBOutlet UIImageView *_logoImageView;
    
    IBOutlet UILabel *_welcomeLabel;
    
    IBOutlet UILabel *_timingLabel;
    
    IBOutlet UILabel *_accountLabel;
    
    IBOutlet UILabel *_passwordLabel;
    
    IBOutlet UIView *_accountView;
    
    IBOutlet UIView *_passwordView;
    
    IBOutlet UIButton *_signInBtn;
    
    AppDelegate * _appDelegate;
    
    IBOutlet UITextField *_phoneTextfield;
    
    IBOutlet UITextField *_passwordTextfield;
}

@end

@implementation SignInVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    _phoneTextfield.tag = 1;
    _passwordTextfield.tag = 2;
    _phoneTextfield.delegate = self;
    _passwordTextfield.delegate = self;
    [[UITextField appearance]setTintColor:[UIColor whiteColor]];
    _signInBtn.layer.masksToBounds = YES;
    _signInBtn.layer.cornerRadius = 4;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)comfirmAction:(id)sender {
    _appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [_appDelegate setupSignInMode];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    // 判断是哪个textfield 点击了隐藏下面的.
    if (textField.tag == 1) {
        _accountLabel.hidden = YES;
    }else {
        _passwordLabel.hidden = YES;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    // 判断是哪个 textfield 点击了隐藏下面的label
    if (textField.tag == 1) {
        if (textField.text.length) {
            
        }
    }
}

- (void)tapGesture {
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    tapGesture.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapGesture];
}

- (void)tapAction {
    if ([_phoneTextfield isFirstResponder]) {
        [_phoneTextfield resignFirstResponder];
    }
    if ([_passwordTextfield isFirstResponder]) {
        [_passwordTextfield resignFirstResponder];
    }
}

@end
