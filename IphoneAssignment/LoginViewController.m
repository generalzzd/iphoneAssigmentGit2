//
//  LoginViewController.m
//  IphoneAssignment
//
//  Created by ZhangZidi on 14-6-10.
//  Copyright (c) 2014年 ZhangZidi. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logindone:(id)sender {
    
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:self.tfusername.text,@"username",self.tfpassword.text,@"password", nil];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"LoginCompletionNotification" object:nil userInfo:dic];
    [self dismissViewControllerAnimated:YES completion:^{}];
}
@end
