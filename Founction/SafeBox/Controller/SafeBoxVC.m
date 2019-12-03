//
//  SafeBoxVC.m
//  MyCode
//
//  Created by CL on 2018/6/12.
//  Copyright © 2018年 CL. All rights reserved.
//

#import "SafeBoxVC.h"


static  NSString * const className = @"Code";
//表名称 “Code”
//系统主键   string   objectId
//自定义唯一标识 number classId
//用户名 string   userName
//密码   string   passWord

@interface SafeBoxVC ()<UITableViewDelegate,UITableViewDataSource>

//@property (nonatomic, strong) NSMutableArray <NSString*> * stringArray;
@property (nonatomic, strong) NSMutableArray <CodeModel*> * modelArray;

@end

@implementation SafeBoxVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(topRightBtnCilck)];
    [self.navigationItem setRightBarButtonItem:rightBtn];
    
    //[self initData]; //获取本地数据源
    
    [self checkDataBase]; //获取远端数据源
    
}

- (void)initData {
    
//    self.stringArray =  [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] arrayForKey:MyDefault]];
//    if (self.stringArray.count > 0) {
//
//        for (NSInteger i = 0; i < self.stringArray.count; i ++) {
//            NSObject * item = self.stringArray[i];
//            if ([item isKindOfClass:[NSString class]]) {
//                NSString * strItem = (NSString *)item;
//                NSArray * strArr = [strItem componentsSeparatedByString:@"-"];
//
//                CodeModel * model = [CodeModel new];
//                model.userName = [strArr firstObject];
//                model.passWord = [strArr lastObject];
//                model.descript = @"迁移";
//                [self.modelArray addObject:model];
//            }
//        }
//    }
//    [self.tableView reloadData];
}

- (void)checkDataBase {
    
    //创建BmobQuery实例，指定对应要操作的数据表名称
    BmobQuery *query = [BmobQuery queryWithClassName:className];
    //按updatedAt进行降序排列
    [query orderByDescending:@"updatedAt"];
    //返回最多20个结果
    query.limit = 50;
    //执行查询
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        //处理查询结果
        for (BmobObject *obj in array) {
            CodeModel * model = [CodeModel new];
            if ([obj objectForKey:@"objectId"]) {
                model.objectId  = [obj objectForKey:@"objectId"];
            }
            
            if ([obj objectForKey:@"classId"]) {
                model.classId  = (NSInteger)[obj objectForKey:@"classId"];
            }
            
            if ([obj objectForKey:@"userName"]) {
                model.userName   = [obj objectForKey:@"userName"];
            }
            if ([obj objectForKey:@"passWord"]) {
                model.passWord  = [obj objectForKey:@"passWord"];
            }

            [self.modelArray addObject:model];
        }
        
        [self.tableView reloadData];
    }];
    
}

- (void)topRightBtnCilck {
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"请输入您的信息" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"输入您的账户";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"输入您的密码";
        textField.secureTextEntry = YES;
    }];
    
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction * sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField * name =alert.textFields.firstObject;
        UITextField * code =alert.textFields.lastObject;
        
        
        
        //把新数据添加到远端
        BmobObject *gameScore = [BmobObject objectWithClassName:className];
        [gameScore setObject:name.text forKey:@"userName"];
        [gameScore setObject:code.text forKey:@"passWord"];
        [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
            //进行操作
        }];

        
        //把新数据插入数组并进行展示
        [self insertObjectWith:name.text andCode:code.text];
        
    }];
    
    [alert addAction:cancel];
    [alert addAction:sure];
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)insertObjectWith:(NSString *)name andCode:(NSString *)code{
    
    ///插入数据到 本地存储
//    NSString * secureStr = [NSString stringWithFormat:@"%@-%@",name,code];
//    [self.stringArray insertObject:secureStr atIndex:0];
//
//    [[NSUserDefaults standardUserDefaults] setObject:self.stringArray forKey:MyDefault];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    ///插入数据到table 数组
    CodeModel * model = [CodeModel new];
    model.userName = name;
    model.passWord = code;
    model.objectId = @"-1";
    [self.modelArray insertObject:model atIndex:0];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell = [cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    NSObject * item = self.modelArray[indexPath.row];
    
    if ([item isKindOfClass:[CodeModel class]]) {
        CodeModel * model = (CodeModel *)item;
        NSString * password = model.passWord ;
        password = @"******";
        cell.textLabel.text = [NSString stringWithFormat:@"账户名:%@- \t密码:%@",model.userName,password];
//        cell.detailTextLabel.text = model.passWord;
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CodeModel * model = self.modelArray[indexPath.row];
    
    DetailViewController * detail = [[DetailViewController alloc] init];
    detail.model = model;
    detail.navigationItem.leftItemsSupplementBackButton = YES;
    
    [self.navigationController pushViewController:detail animated:NO];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        CodeModel * model = self.modelArray[indexPath.row];
        
        if ([model.objectId isEqualToString:@"-1"]) {
            //添加了 但并没有查询获得 主键
            [self checkDataBase];
        }else {
            BmobQuery *bquery = [BmobQuery queryWithClassName:className];
            [bquery getObjectInBackgroundWithId:model.objectId block:^(BmobObject *object, NSError *error){
                if (error) {
                    //进行错误处理
                } else {
                    if (object) {
                        //异步删除object
                        [object deleteInBackground];
                    }
                }
            }];
        }

        [self.modelArray removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        //设置table分割线属性
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_tableView setSeparatorColor:[UIColor blueColor]];
        
        
        _tableView.scrollsToTop = YES;
        _tableView.backgroundColor = [UIColor whiteColor];
        
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 50;
    }
    return _tableView;
}

- (NSMutableArray *)modelArray{
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
