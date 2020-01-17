//
//  SessionTableviewViewController.m
//  TestScrollView
//
//  Created by 超 on 2020/1/10.
//  Copyright © 2020 chao. All rights reserved.
//

#import "SessionTableviewViewController.h"

@interface SessionTableviewViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * rootTableview;
@property(nonatomic,strong)NSArray * data;
@property(nonatomic,strong) UIView * headerView;

@end

@implementation SessionTableviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"测试h会话tableview";
    [self initData];
    
}

-(void) initData{
    
    [self.view addSubview:self.rootTableview];
    [self.rootTableview reloadData];
}

-(UITableView *) rootTableview{
    if (_rootTableview==nil) {
        _rootTableview=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _rootTableview.dataSource=self;
        _rootTableview.delegate=self;
        [_rootTableview setTableHeaderView:self.headerView];
    }
    
    return _rootTableview;
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//
//    return  [NSString stringWithFormat:@"标题：：：：%ld",section];
//}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cell---section:::::%ld     indexcell:::%ld::::",indexPath.section,indexPath.row);
    static NSString * ID= @"cell";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if(section==3){
        return 2;
    }
    
    return 4;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    UILabel * customeLabel=[[UILabel alloc] initWithFrame:CGRectMake(15, 15, self.view.frame.size.width, 20)];
    customeLabel.text=@"我是自定义标题";
    headerView.backgroundColor=[UIColor greenColor];
    [headerView addSubview:customeLabel];
    return headerView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 80;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footerView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    UILabel * customeLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 15)];
    customeLabel.text=@"自定义脚布局标题";
    [footerView addSubview:customeLabel];
    footerView.backgroundColor=[UIColor redColor];
    return footerView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 20;
}
-(UIView *) headerView{
    if (_headerView==nil) {
        _headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 90)];
        _headerView.backgroundColor=[UIColor yellowColor];
        UILabel * titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
        titleLabel.text=@"d只有一个";
        [_headerView addSubview:titleLabel];
    }
    
    
    return _headerView;
}

@end
