//
//  RegistViewController.m
//  IphoneAssignment
//
//  Created by ZhangZidi on 14-6-9.
//  Copyright (c) 2014年 ZhangZidi. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()

@end

@implementation RegistViewController

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

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (IBAction)done:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSDictionary *dic = [NSDictionary dictionaryWithObject:self.tfUsername.text forKey:@"username"];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"RegisterCompletionNotification" object:nil userInfo:dic];
        
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
@end
