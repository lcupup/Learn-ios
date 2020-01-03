//
//  TryFDViewController.m
//  TestScrollView
//
//  Created by 超 on 2019/12/31.
//  Copyright © 2019 chao. All rights reserved.
//

#import "TryFDViewController.h"
#import <Masonry.h>
#import "ContentTableViewCell.h"
#import "ContentTableView.h"
#import "DataSource.h"
@interface TryFDViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView * rootTableView;
@property(nonatomic,strong) NSMutableArray * dataSource;
@property(nonatomic,strong) ContentTableView * contentTableView;

@end

@implementation TryFDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"测试计算嵌套"];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.rootTableView];
    _dataSource= [DataSource tgs];
    [_rootTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    } ];
    
    
}

-(UITableView *) rootTableView{
    if (_rootTableView==nil) {
        _rootTableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _rootTableView.backgroundColor=[UIColor blueColor];
        _rootTableView.delegate=self;
        _rootTableView.dataSource=self;
    }
    return _rootTableView;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID =@"cell";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.row==0) {
        [cell.contentView addSubview:self.contentTableView ];
        [_contentTableView setData:_dataSource];
        NSLog(@"tableview height:: %f",_contentTableView.bounds.size.height);
    }
    
    return cell;
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
};

-(ContentTableView *) contentTableView{
    
    if (_contentTableView==nil) {
        _contentTableView =[[ContentTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400) style:UITableViewStylePlain];
        
    }
    return _contentTableView;
}


@end
