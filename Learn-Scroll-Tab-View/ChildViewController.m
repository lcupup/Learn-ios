//
//  ChildViewController.m
//  TestScrollView
//
//  Created by 超 on 2020/1/4.
//  Copyright © 2020 chao. All rights reserved.
//

#import "ChildViewController.h"


@interface ChildViewController ()
@property(nonatomic,strong) UILabel * contentLabel;
@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
 [self.view addSubview:self.contentLabel];

}
-(void)setContentData:(NSString *)contentStr{
    NSLog(@"setContentData::::%@",contentStr);
    self.contentLabel.text=contentStr;
    
}

-(UILabel *) contentLabel{
    
    if (_contentLabel==nil) {
        NSLog(@"contentlabel::frame.size::::%f",self.view.frame.size.height);
        _contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,500)];
        _contentLabel.textAlignment=NSTextAlignmentLeft;
        _contentLabel.textColor=[UIColor redColor];
        _contentLabel.backgroundColor=[UIColor blueColor];
        _contentLabel.font=[UIFont systemFontOfSize:20];
    }

    return _contentLabel;
}

@end
