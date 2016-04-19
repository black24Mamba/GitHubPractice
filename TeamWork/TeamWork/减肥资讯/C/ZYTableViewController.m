//
//  ZYTableViewController.m
//  Test
//
//  Created by 章鱼 on 16/3/14.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import "ZYTableViewController.h"
#import "ZYModel.h"
#import "ZYXmlTool.h"
#import "ZYTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ZYMessageViewController.h"
@interface ZYTableViewController ()
@property(nonatomic,strong)NSMutableArray *array;

@end
int n = 1;
@implementation ZYTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    /** 注册cell */
    [self.tableView registerClass:[ZYTableViewCell class] forCellReuseIdentifier:@"cell"];
/** 请求数据  */
    [ZYXmlTool requestXMLDataWithUrlStr:@"http://app.hbook.us//openinterface/gethelperbypage.ashx?page=1&pagesize=20&classes=%e8%b5%84%e8%ae%af&sort=1&223" passValueBlock:^(NSArray *arr) {
        self.array = [NSMutableArray arrayWithArray:arr];
        [self.tableView reloadData];
    }];
    /** 设置导航栏 */
    self.navigationItem.title = @"减肥资讯";
    //下拉刷新控件
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshStateChangeUp)];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshStateChangeDown)];
}

/**  上拉加载 */
- (void)refreshStateChangeUp{
    n++;
    [ZYXmlTool requestXMLDataWithUrlStr:[NSString stringWithFormat:@"http://app.hbook.us//openinterface/gethelperbypage.ashx?page=%d&pagesize=20&classes=%%e8%%b5%%84%%e8%%ae%%af&sort=1&223",n] passValueBlock:^(NSArray *arr) {
        [self.array addObjectsFromArray:arr];
        [self.tableView reloadData];
    }];
    [self.tableView.mj_footer endRefreshing];
}
/**  下拉刷新 */
- (void)refreshStateChangeDown{
    [ZYXmlTool requestXMLDataWithUrlStr:@"http://app.hbook.us//openinterface/gethelperbypage.ashx?page=1&pagesize=20&classes=%e8%b5%84%e8%ae%af&sort=1&223" passValueBlock:^(NSArray *arr) {
       self.array = [NSMutableArray arrayWithArray:arr];
        [self.tableView reloadData];
    }];
    [self.tableView.mj_header endRefreshing];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ZYModel *model = self.array[indexPath.row];
    cell.tLabel.text = model.t;
    cell.detailLabel.text = model.date;
    [cell.imageview sd_setImageWithURL:[NSURL URLWithString:model.p]];
    return cell;
}

/** cell行高 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

#pragma mark------------点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYMessageViewController *ZYM = [[ZYMessageViewController alloc]init];
    ZYM.model = self.array[indexPath.row];
    [self.navigationController pushViewController:ZYM animated:YES];
}


















@end

