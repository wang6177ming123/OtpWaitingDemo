//
//  ViewController.m
//  OtpWaitingDemo
//
//  Created by pactera on 17/2/15.
//  Copyright © 2017年 pactera. All rights reserved.
//

#import "ViewController.h"
#import "SPTextFieldCell.h"
#import "SPWattingButton.h"
#import "UIButton+Block.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *table;
@property (nonatomic, strong)NSArray *dataSource;
@property (nonatomic, strong)SPWattingButton *otpButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _dataSource = [NSArray arrayWithObjects:@"手机号",@"验证码", nil];
    [self defaultOtpBtn];//加载验证码，并初始化
    [self.view addSubview:self.table];
}
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 94, self.view.frame.size.width,self.view.frame.size.height - 74) style: UITableViewStyleGrouped];
        _table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _table.delegate = self;
        _table.dataSource = self;
        _table.backgroundColor = [UIColor clearColor];
    }
    return _table;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}


- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SPTextFieldCell *cell = [[SPTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    cell.textLabel.font = Font_CN(15);
    if (indexPath.row == _dataSource.count - 1) {
        [cell.contentView addSubview:self.otpButton];//具体的加载位置
    }
    cell.titleLabel.text = [_dataSource objectAtIndex:indexPath.row];
//    cell.textField.placeholder = 
    return cell;
    
}

-(void)defaultOtpBtn{
    [self.view endEditing:YES];
    _otpButton = [[SPWattingButton alloc] initWithFrame:CGRectMake(W - 115, 5, 95, 34)];//位置，加载所在地为tableview的cell中
    _otpButton.layer.cornerRadius = 4.0f; //圆角设置
    _otpButton.backgroundColor = [UIColor greenColor];
    [_otpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_otpButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    _otpButton.titleLabel.font = [UIFont systemFontOfSize:16];
//    __weak typeof(self) weakSelf = self;
    [_otpButton handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        NSLog(@"点击验证码");
        //此处可能根据后台返回信息来判断是否开始倒计时
                        [self.otpButton beginTimer];
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
