//
//  ICXChoosePickerViewVC.m
//  MyCode
//
//  Created by TYFanrong on 2018/7/19.
//  Copyright © 2018年 CL. All rights reserved.
//

#import "ICXChoosePickerViewVC.h"

@interface ICXChoosePickerViewVC ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong)UIPickerView *startPickerView;

@property (nonatomic, strong)UIButton *cancelBtn;

@property (nonatomic, strong)UIButton *sureBtn;

@property (nonatomic, strong) NSArray<NSArray<NSString *> *> *dataSourceArr;

@property (nonatomic, strong) NSMutableArray<NSNumber *> *curSelectIndexArr;

@end

@implementation ICXChoosePickerViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
}

- (void)layoutUI{
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.startPickerView];
    [self.view addSubview:self.cancelBtn];
    [self.view addSubview:self.sureBtn];
}

- (void)configDataSourceArr:(NSArray<NSArray<NSString *> *> *)dataSourceArr curSelectIndexArr:(NSArray<NSNumber *> *)curSelectIndexArr {
    self.dataSourceArr = dataSourceArr;
    self.curSelectIndexArr = [curSelectIndexArr mutableCopy];
    
    for (NSInteger i = 0; i < self.curSelectIndexArr.count; ++i) {
        [self.startPickerView selectRow:[self.curSelectIndexArr[i] integerValue] inComponent:i animated:NO];
    }
}

#pragma mark - pickerVie delagete

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.dataSourceArr.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataSourceArr[component].count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40.0f;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc]init];
    }
    NSString *title = self.dataSourceArr[component][row];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.startPickerView.frame)/self.dataSourceArr.count, 40)];
    lab.text = title;
    lab.font = [UIFont systemFontOfSize:16];
    lab.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lab];
    return view;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.curSelectIndexArr[component] = @(row);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    dispatch_after(0.3, dispatch_get_main_queue(), ^{
        [self cancelBtnTap];
    });
}
- (void)cancelBtnTap{
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (void)sureBtnTap{
    if (self.didSelectRows) {
        self.didSelectRows(self.curSelectIndexArr);
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (UIPickerView *)startPickerView{
    if (!_startPickerView) {
        _startPickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(15, [UIScreen mainScreen].bounds.size.height - 275, ([UIScreen mainScreen].bounds.size.width - 30), 200)];
        _startPickerView.delegate = self;
        _startPickerView.dataSource = self;
        _startPickerView.backgroundColor = [UIColor whiteColor];
        _startPickerView.layer.masksToBounds = YES;
        _startPickerView.layer.cornerRadius = 4;
    }
    return _startPickerView;
}

- (UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, [UIScreen mainScreen].bounds.size.height - 65, ([UIScreen mainScreen].bounds.size.width - 35) / 2, 50)];
        [_cancelBtn addTarget:self action:@selector(cancelBtnTap) forControlEvents:UIControlEventTouchUpInside];
        [_cancelBtn setTitle:NSLocalizedString(@"取消", @"取消") forState:0];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:0];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_cancelBtn setTintColor:[UIColor blackColor]];
        _cancelBtn.backgroundColor = [UIColor whiteColor];
        _cancelBtn.layer.masksToBounds = YES;
        _cancelBtn.layer.cornerRadius = 4;
    }
    return _cancelBtn;
}

- (UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 35) / 2 +20, [UIScreen mainScreen].bounds.size.height - 65, ([UIScreen mainScreen].bounds.size.width - 35) / 2, 50)];
        [_sureBtn addTarget:self action:@selector(sureBtnTap) forControlEvents:UIControlEventTouchUpInside];
        [_sureBtn setTitle:NSLocalizedString(@"确认", @"确认") forState:0];
        
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_sureBtn setTintColor:[UIColor blackColor]];
        _sureBtn.backgroundColor = [UIColor colorWithRed:42/255.0 green:169/255.0 blue:247/255.0 alpha:1.0];
        _sureBtn.layer.masksToBounds = YES;
        _sureBtn.layer.cornerRadius = 4;
    }
    return _sureBtn;
}

@end
