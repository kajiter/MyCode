//
//  DetailViewController.m
//  MyCode
//
//  Created by CL on 2018/4/20.
//  Copyright © 2018年 CL. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (strong, nonatomic) UILabel *detailDescriptionLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.view addSubview:self.detailDescriptionLabel];
    [self.detailDescriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(80);
        make.centerY.mas_equalTo(self.view.mas_centerY);
    }];
    
    
    
    
    [self configureView];
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.model) {
        self.detailDescriptionLabel.text = [NSString stringWithFormat:@"%@\n%@",self.model.userName,self.model.passWord ];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UILabel *)detailDescriptionLabel {
    if (_detailDescriptionLabel) {
        _detailDescriptionLabel = [[UILabel alloc] init];
        _detailDescriptionLabel.backgroundColor = [UIColor whiteColor];
        _detailDescriptionLabel.textColor = [UIColor blueColor];
        _detailDescriptionLabel.numberOfLines = 2;
        _detailDescriptionLabel.font = [UIFont fontWithName:@"HoeflerText-BlackItalic" size:14];
        _detailDescriptionLabel.layer.borderWidth = 1;
        _detailDescriptionLabel.layer.borderColor = [UIColor grayColor].CGColor;
        _detailDescriptionLabel.layer.cornerRadius = 10;
        _detailDescriptionLabel.layer.masksToBounds = YES;
    }
    
    return _detailDescriptionLabel;
}

@end
