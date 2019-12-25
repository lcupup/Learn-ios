//
//  TabviewViewContronllerViewController.m
//  TestScrollView
//
//  Created by 超 on 2019/12/25.
//  Copyright © 2019 chao. All rights reserved.
//

#import "TabviewViewController.h"
#import "LCLearnTableViewCell.h"

#define  key_name @"name"
@interface TabviewViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * data;
@end

@implementation TabviewViewController


-(NSArray *) data{
    
    if (_data==nil) {
        _data=@[@{key_name:@"hahah"
        },@{key_name:@"dhiadhja"},@{key_name:@"过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦过年啦"},@{key_name:@"你好啊"},@{key_name:@"d哦哦哦"}];
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
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.rowHeight=UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight=88.0;
        [_tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    }
    
    return _tableView;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID=@"cell";
    LCLearnTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[LCLearnTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID ] ;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setName:[self.data[indexPath.row] objectForKey:key_name]];
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"hahah");

}



@end
