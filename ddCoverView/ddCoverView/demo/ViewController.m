//
//  ViewController.m
//  ScrollabelCoverView
//
//  Created by tondyzhang on 16/7/20.
//  Copyright © 2016年 tondy. All rights reserved.
//

#import "ViewController.h"
#import "CoverViewForDemo.h"

#define kCellIdentifier @"cellIdentifierForDemo"

#define kCoverHeight 200
#define kNavigationHeight 64

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView* tableView;
@property(nonatomic, strong)NSMutableArray* dataList;
@property(nonatomic, strong)CoverViewForDemo* coverView;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self initCoverView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationHeight, self.view.bounds.size.width, self.view.bounds.size.height - kNavigationHeight)];
    self.tableView.contentInset = UIEdgeInsetsMake(kCoverHeight-kNavigationHeight, 0, 0, 0); //top inset
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

-(void)initCoverView
{
    self.coverView = [[CoverViewForDemo alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kCoverHeight)];
    [self.coverView registerTableView:self.tableView];
    [self.view addSubview:self.coverView];
}

-(NSMutableArray*)dataList
{
    if (!_dataList) {
        _dataList = [[NSMutableArray alloc]init];
        for (int i =0; i<30; i++) {
            [_dataList addObject:[NSString stringWithFormat:@"row %d",i]];
        }
    }
    return _dataList;
}


#pragma mark -- UITableView dataSource

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }
    if (indexPath.row < self.dataList.count) {
        cell.textLabel.text = [self.dataList objectAtIndex:indexPath.row];
        
    }
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

@end
