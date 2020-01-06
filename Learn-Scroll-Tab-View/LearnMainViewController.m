//
//  LearnMainViewController.m
//  TestScrollView
//
//  Created by 超 on 2020/1/4.
//  Copyright © 2020 chao. All rights reserved.
//

#import "LearnMainViewController.h"
#import "ChildViewController.h"
#import <SGPagingView.h>


@interface LearnMainViewController ()<UITableViewDelegate,UITableViewDataSource,SGPageTitleViewDelegate,SGPageContentScrollViewDelegate>
 
@property(nonatomic,strong) UITableView * rootTableView;
@property(nonatomic,strong) NSArray * dataSource;
@property(nonatomic,strong) NSArray * titleArr;

@property(nonatomic,strong) SGPageTitleView * pageTitleView;
@property(nonatomic,strong) SGPageContentScrollView * pageContentScrollView;
@property(nonatomic,strong) UIView * footerView;

@end

@implementation LearnMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setTitle:@"练习 viewpager"];
    [self.view setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:self.rootTableView];
    [self.rootTableView reloadData];
    self.titleArr=@[@"我是第一",@"我是第2",@"我是第3",@"我是第4"];
    [self initPageTitleView];
    
 }


-(void) initData{

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static  NSString * ID =@"cell";
    
    UITableViewCell *  cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
      cell.textLabel.text= [NSString stringWithFormat:@"测试测试 - ChildVCOne - - %ld", (long)indexPath.row];
    
    return cell;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}


-(UITableView *) rootTableView{
    if (_rootTableView==nil) {
        _rootTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _rootTableView.delegate=self;
        _rootTableView.dataSource=self;
    }
    return _rootTableView;
}

-(void) initPageTitleView{
    SGPageTitleViewConfigure * configure=[SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleFont=[UIFont systemFontOfSize:12];
    configure.indicatorHeight=3;
    configure.indicatorCornerRadius=5;
    configure.indicatorToBottomDistance=5;
    configure.indicatorColor=[UIColor blueColor];
    configure.titleSelectedColor=[UIColor blueColor];
    configure.titleSelectedFont=[UIFont systemFontOfSize:12];
    configure.indicatorStyle=SGIndicatorStyleDefault;
    configure.bottomSeparatorColor=[UIColor whiteColor];
    
    self.pageTitleView=[SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44) delegate:self titleNames:self.titleArr configure:configure];

    _footerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 500)];
    _footerView.backgroundColor=[UIColor whiteColor];
    [self.footerView addSubview:self.pageTitleView];
    
    _pageTitleView.selectedIndex=0;
    
    ChildViewController * oneVC=[[ChildViewController alloc] init];
    [oneVC setContentData:@"我是第一"];
    ChildViewController * twoVC= [[ChildViewController alloc] init];
    [twoVC setContentData:@"222222"];
    ChildViewController * threeVC= [[ChildViewController alloc] init];
    [threeVC setContentData:@"333333"];
    ChildViewController * fourVC=[[ChildViewController alloc] init];
    [fourVC setContentData:@"4444444"];
    
    
    NSArray * childVCArr =@[oneVC,twoVC,threeVC,fourVC];
    CGFloat contentViewHeight=500;
    
    self.pageContentScrollView=[[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, contentViewHeight) parentVC:self childVCs:childVCArr];
    _pageContentScrollView.delegatePageContentScrollView=self;
    [self.footerView addSubview:self.pageContentScrollView];
    [self.rootTableView setTableFooterView:self.footerView];
    
}

-(void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    [self.pageContentScrollView setPageContentScrollViewCurrentIndex:selectedIndex];
}
- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView index:(NSInteger)index {
    /// 说明：在此获取标题or当前子控制器下标值
    NSLog(@"index - - %ld", index);
}

//
//-(SGPageContentScrollView *)pageContentScrollView{
//    if (_pageContentScrollView==nil) {
//        _pageContentScrollView=
//    }
//
//
//
//
//    return _pageContentScrollView;
//}
//-(SGPageTitleView *) pageTitleView{
//    if (_pageTitleView==nil) {
//
//
//    }
//
//    return _pageTitleView;
//}

//-(UIView *) footerView{
//    if (_footerView==nil) {
//        _footerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
//        _footerView.backgroundColor=[UIColor blueColor];
//
//    }
//
//
//    return _footerView;
//}

@end
