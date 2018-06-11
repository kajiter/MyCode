//
//  DetailViewController.m
//  MyCode
//
//  Created by CL on 2018/4/20.
//  Copyright © 2018年 CL. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

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
    if (self.detailStr) {
        self.detailDescriptionLabel.text = self.detailStr ;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UILabel *)detailDescriptionLabel {
    if (_detailDescriptionLabel) {
        _detailDescriptionLabel = [[UILabel alloc]init];
    }
    
    return _detailDescriptionLabel;
}

@end
