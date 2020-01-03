//
//  ContentTableViewCell.m
//  TestScrollView
//
//  Created by 超 on 2019/12/31.
//  Copyright © 2019 chao. All rights reserved.
//

#import "ContentTableViewCell.h"
#import <Masonry.h>
@interface ContentTableViewCell()
@property(nonatomic,strong) UILabel * title;
@property(nonatomic,strong) UILabel * desc;

@end
@implementation ContentTableViewCell



-(void)setData:(NSDictionary * ) data{
    
    [self initView];
    self.title.text=data[@"title"];
    self.desc.text=data[@"desc"];
}


-(void) initView {
    [self.contentView addSubview:self.title];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.top.equalTo(self.contentView.mas_top).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
    }];
    
    [self.contentView addSubview:self.desc];
    [_desc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom).offset(15);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-15);
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
    }];
    
    
    
    
}



-(UILabel *) title{
    if (_title==nil) {
        _title=[[UILabel alloc] init];
        _title.font=[UIFont systemFontOfSize:18];
        _title.textColor=[UIColor greenColor];
    }
    
    
    return _title;
    
}
-(UILabel *) desc {
    
    if (_desc==nil) {
        _desc=[[UILabel alloc] init];
        _desc.backgroundColor=[UIColor orangeColor];
        _desc.adjustsFontSizeToFitWidth=YES;
        _desc.numberOfLines=0;
    }
    return _desc;
}



@end
