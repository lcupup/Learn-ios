//
//  NetViewController.m
//  TestScrollView
//
//  Created by 超 on 2019/12/17.
//  Copyright © 2019 chao. All rights reserved.
//

#import "NetViewController.h"
#import "NetWorkManager.h"

@interface NetViewController ()

@property(nonatomic,strong) UILabel * sendRequestBtn;

@end

@implementation NetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NetWorkManager setup];
    self.title=@"测试网络请求";
    [self initView];
}


-(void) initView{
    
    [self.view addSubview:self.sendRequestBtn];
    
    
}


-(UILabel *) sendRequestBtn{
    
    if (_sendRequestBtn==nil) {
        _sendRequestBtn=[[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _sendRequestBtn.text=@"登录";
        _sendRequestBtn.userInteractionEnabled=YES;
        _sendRequestBtn.textAlignment=NSTextAlignmentCenter;
        _sendRequestBtn.backgroundColor=[UIColor greenColor];
        UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sendRequestLogin:)];
        [_sendRequestBtn addGestureRecognizer:labelTapGestureRecognizer];
    }
    
    
    return _sendRequestBtn;
}


-(void) sendRequestLogin:(UITapGestureRecognizer *)recognizer{
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.api=@"/m/p/a/check/17638107217";
        request.httpMethod=kXMHTTPMethodGET;
   
    }onSuccess:^(id  _Nullable responseObject) {
        NSLog(@"******%@",responseObject);
    }onFailure:^(NSError * _Nullable error) {
        
    }];
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
