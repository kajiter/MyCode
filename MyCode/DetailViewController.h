//
//  DetailViewController.h
//  MyCode
//
//  Created by CL on 2018/4/20.
//  Copyright © 2018年 CL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (strong, nonatomic) NSString *detailStr;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

