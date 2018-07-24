//
//  InfomationVC.m
//  MyCode
//
//  Created by CL on 2018/6/11.
//  Copyright © 2018年 CL. All rights reserved.
//

#import "InfomationVC.h"

#import "MenuResultModel.h"

#import "PhoneResultModel.h"
#import "MenuDetailVC.h"

@interface InfomationVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView * tableView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)NSArray <bigChildsModel*>* bigChildArray ;

@property (nonatomic, strong)UITextField * telephone;
@property (nonatomic, strong)UILabel * teleInfoLabel;

@end

@implementation InfomationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
    
    [self initData];
    
    

    
    
}

-(void)initView {
    
    UIView * header = [UIView new];
    header.backgroundColor = [UIColor redColor];
    header.frame = CGRectMake(0, 0, kScreenWidth, 50);
    self.tableView.tableHeaderView = header;
    
    UITextField * tele = [[UITextField alloc]init];
    tele.placeholder = @"请输入要查询的手机号";
    tele.borderStyle = UITextBorderStyleRoundedRect;
    tele.keyboardType = UIKeyboardTypePhonePad;
    [header addSubview:tele];
    [tele mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(header);
        make.right.mas_equalTo(header).mas_offset(110);
        make.height.mas_equalTo(30);
    }];
    self.telephone = tele;
    
    UILabel * info = [[UILabel alloc]init];
    info.textColor = [UIColor blackColor];
    [header addSubview:info];
    [info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(header);
        make.right.mas_equalTo(header).mas_offset(100);
        make.height.mas_equalTo(15);
    }];
    self.teleInfoLabel = info;
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"查询" forState: UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [header addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 50));
        make.right.mas_equalTo(header);
        make.centerY.mas_equalTo(header.mas_centerY);
    }];
    
    
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, kAPPTabbarHeight, 0);
}

- (void)initData{
    
    self.telephone.text = @"13266588187";
    
    [MobAPI sendRequest:[MOBACookRequest categoryRequest] onResult:^(MOBAResponse *response) {
        if (response.error){
            NSLog(@"request error = %@", response.error);
        }else{
            NSLog(@"request success = %@", response.responder);
            
            MenuResultModel * responder = [MenuResultModel modelWithJSON:response.responder];
            
            resultModel * result = responder.result;
            NSArray <bigChildsModel*>* bigChildArray = result.bigChilds;
        
            self.bigChildArray = bigChildArray;
            [self.tableView reloadData];
        }
    }];
    
    
}



-(void)btnClick {
    [self.telephone resignFirstResponder];
    
    NSInteger userCount = [[NSUserDefaults standardUserDefaults] integerForKey:@"UserID"];
    if (userCount == 0) {
        userCount = 100;
    }else{
        //不等于0 的时候
        userCount ++;
    }
    [[NSUserDefaults standardUserDefaults] setInteger:userCount forKey:@"UserID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    if (self.telephone.text.length != 11) {
        return;
    }

    [MobAPI sendRequest:[MOBAPhoneRequest addressRequestByPhone:self.telephone.text] onResult:^(MOBAResponse *response) {
        if (response.error){
            NSLog(@"request error = %@", response.error);
        }else{
            NSLog(@"request success = %@", response.responder);
            NSDictionary * dict = response.responder;
            NSDictionary * result = dict[@"result"];
            PhoneResultModel * model = [PhoneResultModel modelWithDictionary:result];
            
            self.teleInfoLabel.text = [NSString stringWithFormat:@"%@-%@",model.city,model.zipCode];
        }
    }];
    
    

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.bigChildArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    bigChildsModel * bigChild = [self.bigChildArray objectAtIndex:section];
    //categoryInfo * category = bigChild.categoryInfo;
    NSArray <childsModel *> * childArray = bigChild.childs;
    return childArray.count;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    bigChildsModel * bigChild = [self.bigChildArray objectAtIndex:section];
    categoryInfo * category = bigChild.categoryInfo;

    UILabel * sectionLabel = [UILabel new];
    sectionLabel.frame = CGRectMake(0, 0, kScreenWidth, 60);
    sectionLabel.textAlignment = NSTextAlignmentCenter;
    sectionLabel.backgroundColor = UIColorHex(0x559999);
    sectionLabel.textColor = [UIColor whiteColor];
    sectionLabel.text = category.name;
    
    return sectionLabel;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    bigChildsModel * bigChild = [self.bigChildArray objectAtIndex:indexPath.section];

    NSArray <childsModel *> * childArray = bigChild.childs;
    childsModel * child = [childArray objectAtIndex:indexPath.row];
    
    
    cell.textLabel.text = child.categoryInfo.name;
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    bigChildsModel * bigChild = [self.bigChildArray objectAtIndex:indexPath.section];
    
    NSArray <childsModel *> * childArray = bigChild.childs;
    childsModel * child = [childArray objectAtIndex:indexPath.row];
    
    MenuDetailVC * menuVC = [MenuDetailVC new];
    menuVC.category = child.categoryInfo;
    [self.navigationController pushViewController:menuVC animated:YES];
  
}




- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate= self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 44;
        
        
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
