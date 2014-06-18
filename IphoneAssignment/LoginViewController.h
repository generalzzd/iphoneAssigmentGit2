//
//  LoginViewController.h
//  IphoneAssignment
//
//  Created by ZhangZidi on 14-6-10.
//  Copyright (c) 2014年 ZhangZidi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
- (IBAction)logindone:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tfpassword;

@property (weak, nonatomic) IBOutlet UITextField *tfusername;
@end
