//
//  HelpViewController.m
//  IphoneAssignment
//
//  Created by ZhangZidi on 14-6-7.
//  Copyright (c) 2014年 ZhangZidi. All rights reserved.
//

#import "HelpViewController.h"
#import "HelpChildViewController.h"
#include<iostream>
#include<string>


@interface HelpViewController ()

@end

@implementation HelpViewController

@synthesize pathdb = _pathdb;

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

    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3,self.scrollView.frame.size.height);
    self.scrollView.frame = self.view.frame;
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController* page1ViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"hpage1"];
    self.page1 = page1ViewController.view;
    self.page1.frame = CGRectMake(0.0f, 0.0f, 320.0f, 480.0f);
    
    UIViewController* page2ViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"hpage2"];
    self.page2 = page2ViewController.view;
    self.page2.frame = CGRectMake(320.0f, 0.0f, 320.0f, 480.0f);
    
    HelpChildViewController* page3ViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"hpage3"];
    
    self.page3 = page3ViewController.view;
    self.page3.frame = CGRectMake(2*320.0f, 0.0f, 320.0f, 480.0f);
    
    self.scrollView.delegate = self;
    
    [self.scrollView addSubview:self.page1];
    [self.scrollView addSubview:self.page2];
    [self.scrollView addSubview:self.page3];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registdone:) name:@"RegisterCompletionNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logindone:) name:@"LoginCompletionNotification" object:nil];
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

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
        CGPoint offset = scrollView.contentOffset;
        self.pageControl.currentPage = offset.x / 320.0f;
}

-(void)changePage:(id)sender
{
    [UIView animateWithDuration:0.3f animations:^{
        int whichPage = self.pageControl.currentPage;
        self.scrollView.contentOffset = CGPointMake(320.0f*whichPage, 0.0f);
    }];
}

- (IBAction)btnRegistTouchDown:(id)sender {
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *registpage = [board instantiateViewControllerWithIdentifier:@"registpage"];
    registpage.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:registpage animated:YES completion:^(){}];
}

- (IBAction)btnLoginTouchDown:(id)sender {
    
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * vc = [sb instantiateViewControllerWithIdentifier:@"loginpage"];
    
    [self presentViewController:vc animated:YES completion:^{}];
}

-(void)registdone : (NSNotification*)notif
{
    NSDictionary *thedata = [notif userInfo];
    NSString* username = [thedata objectForKey:@"username"];
    NSLog(@"%@",username);
}
-(void)logindone:(NSNotification *)notifs
{
    NSDictionary *dic = [notifs userInfo];
    NSString *username = [dic objectForKey:@"username"];
    NSString *password = [dic objectForKey:@"password"];
    NSLog(@"username:%@",username);
    NSLog(@"password:%@",password);
    
    NSString* str = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    self.pathdb = [NSString stringWithFormat:@"%@/userdb.db3",str];
    if(![self checkDBIsExist:self.pathdb])
    {
        [self createDB:self.pathdb];
    }
    [self insertUserWithUsername:username AndPassword:password];
}
-(void)createDB : (NSString*)filename
{
    int ret = sqlite3_open([filename cStringUsingEncoding:NSUTF8StringEncoding],&self->db);
    if(ret == SQLITE_ERROR)
    {
        NSLog(@"open db failed!");
        return;
    }
    char* sql = "create table ZUser (id integer primary key not null,username text not null,password text not null )";
    
    char *errmsg;
    ret = sqlite3_exec(self->db, sql, NULL, NULL, &errmsg);
    if(ret == SQLITE_ERROR)
    {
        NSLog(@"%@",[NSString stringWithUTF8String:errmsg]);
        return ;
    }
    sqlite3_close(self->db);
}
-(void)insertUserWithUsername : (NSString*)username AndPassword :(NSString*)password
{
    using namespace std;
    int ret = sqlite3_open([self.pathdb cStringUsingEncoding:NSUTF8StringEncoding],&self->db);
    if(ret == SQLITE_ERROR)
    {
        NSLog(@"open db failed!");
        return;
    }
    string un= [username cStringUsingEncoding:NSUTF8StringEncoding];
    string pd =[password cStringUsingEncoding:NSUTF8StringEncoding];
    string sql = "insert into ZUser (username,password) values('"+un+"','"+pd+"')";
    
    char *errmsg;
    ret = sqlite3_exec(self->db, sql.c_str(), NULL, NULL, &errmsg);
    if(ret == SQLITE_ERROR)
    {
        NSLog(@"%@",[NSString stringWithUTF8String:errmsg]);
        return ;
    }
    sqlite3_close(self->db);
}
-(BOOL)checkDBIsExist:(NSString*)path
{
    NSFileManager *file_manager = [NSFileManager defaultManager];
    return [file_manager fileExistsAtPath:path];
}

@end
