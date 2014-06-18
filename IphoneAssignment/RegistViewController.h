//
//  RegistViewController.h
//  IphoneAssignment
//
//  Created by ZhangZidi on 14-6-9.
//  Copyright (c) 2014年 ZhangZidi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
