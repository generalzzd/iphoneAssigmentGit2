//
//  DemoTableViewController.h
//  IphoneAssignment
//
//  Created by ZhangZidi on 14-6-10.
//  Copyright (c) 2014年 ZhangZidi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property NSArray *data;
@property (weak, nonatomic) IBOutlet UITableView *mytable;


@end
