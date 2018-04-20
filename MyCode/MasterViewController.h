//
//  MasterViewController.h
//  MyCode
//
//  Created by CL on 2018/4/20.
//  Copyright © 2018年 CL. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MyDefault @"mydefault"

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

