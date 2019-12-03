//
//  BaseScrollVC.m
//  HSZMarket
//
//  Created by HaoShiZai on 2016/12/1.
//  Copyright © 2016年 kajiter. All rights reserved.
//

#import "BaseScrollVC.h"
#import "Define.h"


@interface BaseScrollVC ()  {
    
    CGSize _keyboardSize;
}

@end

@implementation BaseScrollVC

//- (void)loadView {
//    [super loadView];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//    return;
//}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.tableView.hidden = YES;
    [self baseCreateScrollView];
    

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    
}


-(void)baseCreateScrollView {
    
    _scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0 , kscreen, kMainScreenHeight - 64)];
    _scroll.contentSize = CGSizeMake(kMainScreenWidth, kMainScreenHeight);
    _scroll.delegate = self ;
    [self.view addSubview:_scroll];
    
    _scroll.showsVerticalScrollIndicator = NO;
    _scroll.showsHorizontalScrollIndicator = NO;
}



#pragma mark 键盘弹出，弹下响应事件
-(void)keyboardShow:(NSNotification *) notif {
    NSValue *value = [notif.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
    _keyboardSize = [value CGRectValue].size;
    
    self.scroll.contentSize = CGSizeMake(kMainScreenWidth, (kMainScreenHeight ) + _keyboardSize.height);
    
    
}
-(void)keyboardHide:(NSNotification *) notif {
    
    self.scroll.contentSize = CGSizeMake(kMainScreenWidth, kMainScreenHeight );
    
}




#pragma mark  点击键盘 done 按钮响应，键盘下降
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
