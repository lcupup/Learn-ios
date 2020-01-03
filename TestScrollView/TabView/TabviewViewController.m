//
//  TabviewViewContronllerViewController.m
//  TestScrollView
//
//  Created by 超 on 2019/12/25.
//  Copyright © 2019 chao. All rights reserved.
//

#import "TabviewViewController.h"
#import "LCLearnTableViewCell.h"
#import "LCTableViewOne.h"

#define  key_name @"name"
@interface TabviewViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * data;
@property (nonatomic, strong) LCTableViewOne *tableViewOne;
@end

@implementation TabviewViewController


-(NSArray *) data{
    
    if (_data==nil) {
        _data=@[@{key_name:@"hahah"
        },@{key_name:@"dhiadhja"},@{key_name:@"过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦"},@{key_name:@"你好啊"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"d哦哦哦"},@{key_name:@"过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦"},@{key_name:@"过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦"},@{key_name:@"过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦"},@{key_name:@"过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦"},@{key_name:@"hello"},@{key_name:@"hello"},@{key_name:@"hello"},@{key_name:@"hello"}];
    }
    return _data;
}


- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:self.tableView];

    
}



-(UITableView *) tableView{
    if (_tableView==nil) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,200)];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.rowHeight=UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight=88.0;
        [_tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    }
    
    return _tableView;
    
}

- (LCTableViewOne *)tableViewOne {
    if (_tableViewOne == nil) {
        _tableViewOne=[[LCTableViewOne alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
               _tableViewOne.delegate=self;
               _tableViewOne.dataSource=self;
               _tableViewOne.rowHeight=UITableViewAutomaticDimension;
               _tableViewOne.estimatedRowHeight=88.0;
        _tableViewOne.dateDic = nil;
//               [_tableViewOne setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    }
    return _tableViewOne;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row ==0) {
        
        
        
        return _tableViewOne.contentSize.height;
    }
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID=@"cell";
    LCLearnTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[LCLearnTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID ] ;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setName:[self.data[indexPath.row] objectForKey:key_name]];
    

    
//    if (indexPath.section == 0) {
        
        if (indexPath.row ==0) {
            [cell.contentView addSubview:_tableViewOne];
            _tableViewOne.frame = CGRectMake(0, 0, self.view.frame.size.width,_tableViewOne.contentSize.height);
            [tableView reloadData];
            
        }
//    }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"hahah");

}



@end
