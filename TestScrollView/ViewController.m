//
//  ViewController.m
//  TestScrollView
//
//  Created by 超 on 2019/12/4.
//  Copyright © 2019 chao. All rights reserved.
//

#import "ViewController.h"
#import "GKCycleScrollView.h"
#import <Masonry/Masonry.h>

@interface ViewController ()<GKCycleScrollViewDelegate,GKCycleScrollViewDataSource>
@property(nonatomic,strong)NSArray * dataArr;

@property(nonatomic,strong)GKCycleScrollView * cycleScrollView;
@property(nonatomic,assign)BOOL isClickCategory;
@property(nonatomic,assign)BOOL isSelectCategory;
@property(nonatomic,strong) UIScrollView * uiscrollView;
@property(nonatomic,strong) UIView * contentView;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
    
}


-(void) initData{
    self.dataArr=@[@{@"title": @"我是标题我是标题",@"img_url":@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3724300455,3419815340&fm=26&gp=0.jpg"},@{@"title":@"我是标题我是标题",@"img_url":@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3657258270,1485602730&fm=26&gp=0.jpg"},@{@"title":@"我是标题我是标题",@"img_url":@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3657258270,1485602730&fm=26&gp=0.jpg"},@{@"title":@"我是标题我是标题",@"img_url":@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3657258270,1485602730&fm=26&gp=0.jpg"},@{@"title":@"我是标题我是标题",@"img_url":@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3657258270,1485602730&fm=26&gp=0.jpg"}];
    
}

-(void) initView {
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.uiscrollView];
    [self.uiscrollView addSubview:self.contentView];

    [_uiscrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.view.mas_height);
        make.width.equalTo(self.view.mas_width);
    }];
    

    [self.contentView addSubview:self.cycleScrollView];
    [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_top).offset(65);
        make.height.mas_equalTo(200.0f);
    }];
    [self.cycleScrollView reloadData];
    
}




-(UIScrollView *) uiscrollView{
    if (_uiscrollView==nil) {
    
        _uiscrollView=[[UIScrollView alloc] init];
        _uiscrollView.alwaysBounceHorizontal=NO;
    }
    
    return _uiscrollView;
}
-(UIView *) contentView{
    
    if (_contentView==nil) {
        _contentView=[[UIView alloc] init];
        _contentView.backgroundColor=[UIColor orangeColor];
    }
    return _contentView;
    
}


-(GKCycleScrollView * )cycleScrollView{
    if (!_cycleScrollView) {
        _cycleScrollView=[GKCycleScrollView new];
        _cycleScrollView.dataSource=self;
        _cycleScrollView.delegate=self;
        _cycleScrollView.isAutoScroll=NO;
        _cycleScrollView.isInfiniteLoop=NO;
        _cycleScrollView.isChangeAlpha=NO;
        _cycleScrollView.leftRightMargin=30.0f;

    }
    return _cycleScrollView;
}

-(NSInteger)numberOfCellsInCycleScrollView:(GKCycleScrollView *)cycleScrollView{
    return self.dataArr.count;
}
- (void)cycleScrollView:(GKCycleScrollView *)cycleScrollView didSelectCellAtIndex:(NSInteger)index{
    NSLog(@"点击cell背景%ld,",(long)index);
}

-(void)cycleScrollView:(GKCycleScrollView *)cycleScrollView didScrollCellToIndex:(NSInteger)index{
}

- (void)cycleScrollView:(GKCycleScrollView *)cycleScrollView didSelectCellLabelAtIndex:(NSInteger)index {
    NSInteger LabelTagIndex = index - 0x11111111;
    NSLog(@"点击label%ld,",(long)LabelTagIndex);
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"dajdjhajdkabh");
}
-(GKCycleScrollViewCell *)cycleScrollView:(GKCycleScrollView *)cycleScrollView cellForViewAtIndex:(NSInteger)index{
    GKCycleScrollViewCell *cell= [cycleScrollView dequeueReusableCell];
    if (!cell) {
        cell=[GKCycleScrollViewCell new];
        cell.layer.cornerRadius=10.0f;
        cell.layer.masksToBounds=YES;
        cell.imageView.contentMode=UIViewContentModeScaleAspectFit;
    }
    NSDictionary * dict =self.dataArr[index];
    [cell.label setText:dict[@"title"]];
    return cell;
    
}

-(CGSize)sizeForCellInCycleScrollView:(GKCycleScrollView *)cycleScrollView{
    return CGSizeMake(ceil(300.0f), 200.0f);
}




@end
