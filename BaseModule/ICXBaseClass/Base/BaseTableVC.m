//
//  BaseTableVC.m
//  HSZTF
//
//  Created by CL on 2017/2/24.
//  Copyright © 2017年 CL. All rights reserved.
//

#import "BaseTableVC.h"

@interface BaseTableVC ()

@end

@implementation BaseTableVC

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    
    self.navigationController.navigationBarHidden = NO;
    
    if ([[UIStackManager shareManager] currentNavigationController].viewControllers.count == 1) {
        self.tabBarController.tabBar.hidden = NO;
        
    }else{
        self.tabBarController.tabBar.hidden = YES;
        
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        dic[NSForegroundColorAttributeName] = kWhiteColor;
        dic[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#FFFFFF"];
        dic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
        self.navigationController.navigationBar.titleTextAttributes =  dic;
        
    }
    
    [MobClick beginLogPageView:self.title];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.view.backgroundColor = kBackGroundGrayColor ;
    
    [self createTableView];
    
    
    [self baseCreateAlphaView];
    
    [self createEmptyImageView];
    
    [self loadNeedLoginNotification];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);

    
}






-(void)createTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    self.tableView.backgroundColor = kClearColor ;
    
    
    //xcode9.0以后关闭自动估算行高
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
}

-(void)createEmptyImageView {

    UIImageView * empty = [[[UIImageView alloc]initWithFrame:CGRectMake(0 , 64 + (kMainScreenHeight - 104 - 215) /2, kMainScreenWidth , 215)] initWithImage:[UIImage imageNamed:@"emptyPlaceHolder"]]  ;
    _emptyImageView = empty;
    [self.view addSubview:empty];
    [self.view sendSubviewToBack:empty];
    empty.hidden = YES;
}


- (void)baseCreateAlphaView {
    _alphaView = [[UIView alloc]initWithFrame:self.view.bounds];
    _alphaView.backgroundColor = kBlackColor ;
    _alphaView.alpha = 0.6 ;
    
    [self.view addSubview:_alphaView];
    [self.view sendSubviewToBack:_alphaView];
    _alphaView.hidden = YES;
}

//提供继承
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch * touch in touches) {
        if (touch.view == _alphaView) {
            [self touchAlphaViewAction];
        }
    }
}

//提供重用
-(void)touchAlphaViewAction {
    
    _alphaView.hidden = YES;
    [self.view sendSubviewToBack:_alphaView];
}




//提供弹窗消息便于继承调用
-(void)showAlertViewWithTag:(NSInteger)tag andMessage:(NSString *)message {
    
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:message delegate:self cancelButtonTitle:@"确认" otherButtonTitles: nil];
    alert.tag = tag;
    
    [alert show];
}



//提供提醒消息便于继承调用
-(void)showHUD:(NSString *)message andTime:(NSInteger)time {

    [MyTools showHUD:message andTime:time];
}

-(void)showHudProgress:(NSInteger)time {
    
    [MyTools showHUD:@"正在加载" andTime:time];
}



-(void)setTopRightBtnWithImage:(NSString *)imageName {
    
    UIBarButtonItem * topRightBtn = [[UIBarButtonItem alloc] initWithImage:CLGetImage(imageName) style:UIBarButtonItemStylePlain target:self action:@selector(topRightBtnC)];

    self.navigationItem.rightBarButtonItem = topRightBtn;
}

-(void)setTopRightBtnWithTitle:(NSString *)title {
    
    UIBarButtonItem * topRightBtn = [[UIBarButtonItem alloc]  initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(topRightBtnC)];

    self.navigationItem.rightBarButtonItem = topRightBtn;
}





#pragma mark  点击键盘 done 按钮响应，键盘下降
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}



#pragma mark 网络请求到错误100 用户登录已过期时，提供接口
-(void)loadNeedLoginNotification {

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(needLogin) name:k_NeedLoginNoti object:nil];
}


-(void)needLogin {

    [ShareSDK cancelAuthorize:SSDKPlatformTypeSinaWeibo];
    
    [self resetUserLogOutTimeStatus];

}


//发现用户网络请求到超时时，改变用户登录状态。
-(void)resetUserLogOutTimeStatus {
    
    [ShareSDK cancelAuthorize:SSDKPlatformTypeSinaWeibo];
    [[HSZManager shareManager] setLoginStatus:NO];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == k_needLogin) {
        [[UIStackManager shareManager].currentNavigationController pushViewController:[LoginVC new] animated:YES];
    }
}


-(void)topRightBtnC {
    
    NSLog(@"111111");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    NSLog(@"如果不在.h中声明方法，子类调用时会先调用父类方法");
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [MobClick endLogPageView:self.title];
}

@end
