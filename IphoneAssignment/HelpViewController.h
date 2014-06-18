//
//  HelpViewController.h
//  IphoneAssignment
//
//  Created by ZhangZidi on 14-6-7.
//  Copyright (c) 2014年 ZhangZidi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface HelpViewController : UIViewController <UIScrollViewDelegate>
{
    sqlite3 *db;
}
//sqlite
@property NSString *pathdb;

//
@property (strong,nonatomic) UIView *page1;
@property (strong,nonatomic) UIView *page2;
@property (strong,nonatomic) UIView *page3;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)changePage:(id)sender;

- (IBAction)btnRegistTouchDown:(id)sender;
- (IBAction)btnLoginTouchDown:(id)sender;

- (void)registdone :(NSNotification*)notifs;
-(void)logindone:(NSNotification*)notifs;

@end
