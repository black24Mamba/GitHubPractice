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
@interface ZYTableViewController ()
@property(nonatomic,strong)NSMutableArray *array;

@end

@implementation ZYTableViewController

- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[ZYTableViewCell class] forCellReuseIdentifier:@"cell"];

    [ZYXmlTool requestXMLDataWithUrlStr:@"http://apps.caredsp.com/openinterface/gethelperbypage.ashx?page=1&pagesize=20&classes=%E5%87%8F%E8%82%A5%E5%8A%A9%E6%89%8B_%E5%87%8F%E8%82%A5&deviceTypeId=2" passValueBlock:^(NSArray *arr) {
        [self.array addObjectsFromArray:arr];
        [self.tableView reloadData];
        NSLog(@"%@", [NSThread currentThread]);
        NSLog(@"%@", [NSThread mainThread]);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%ld", self.array.count);
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
    return 105;
}

@end
