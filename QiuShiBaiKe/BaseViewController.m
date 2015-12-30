//
//  BaseViewController.m
//  QiuShiBaiKe
//
//  Created by qianfeng07 on 15/11/28.
//  Copyright © 2015年 JasonZhang. All rights reserved.
//

#import "BaseViewController.h"
#import "ZHCell.h"
#import "ZHModel.h"
#import <AFNetworking/AFNetworking.h>
#import <MJRefresh/MJRefresh.h>

@interface BaseViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    ZHModel *_model;
    // 用于保存items总数
    NSInteger _refresh;
    
    NSMutableArray *_dataSource;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    _dataSource = [[NSMutableArray alloc] init];
    _model = [[ZHModel alloc] init];
    
    [self downLoadData:NO];
}


- (void)rightItemAction:(UIBarButtonItem *)rightItem
{
    
}

- (void)leftItemAction:(UIBarButtonItem *)leftItem
{
    
}


- (void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGTH - 49- 64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    UIImage *backgroundImage = [UIImage imageNamed:@"pulish_bg"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = backgroundImage;
    [_tableView setBackgroundView:imageView];
    
    UINib *nib = [UINib nibWithNibName:@"ZHCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"ZHCellId"];
    [self.view addSubview:_tableView];
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self downLoadData:NO];
    }];
    
    _tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self downLoadData:YES];
    }];
    _tableView.mj_footer = footer;
    [_tableView.mj_header beginRefreshing];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}
- (ZHCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ZHCellId";
    ZHCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    [cell updateWithData:_dataSource[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.height;
}

#pragma mark - 网络下载
- (void)downLoadData:(BOOL)isMore
{
    
    NSInteger page = 0;
    if (isMore) {
        if (_dataSource.count % 10 == 0) {
            page = _dataSource.count / 10;
        } else if (_dataSource.count == _refresh){
            [_tableView.mj_footer endRefreshing];
            return;
        }
    }
    NSString *url = nil;
    int newPage = (int)page;
    if ([self.navigationController.title isEqualToString:@"最糗"]) {
        url = DayURLString(10, newPage);
        NSLog(@"%@", url);
    } else if ([self.navigationController.title isEqualToString:@"最新"]){
        url = LastestURLString(10, newPage);
    } else {
        return;
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (!isMore) {
            [_dataSource removeAllObjects];
            [_tableView reloadData];
        }
        _model = [[ZHModel alloc] initWithData:responseObject error:nil];
        for (itemsModel *model in _model.items) {
            [_dataSource addObject:model];
        }
        _refresh = [_model.refresh integerValue];
        [_tableView reloadData];
        isMore?[_tableView.mj_footer endRefreshing] : [_tableView.mj_header endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        isMore?[_tableView.mj_footer endRefreshing] : [_tableView.mj_header endRefreshing];
    }];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
