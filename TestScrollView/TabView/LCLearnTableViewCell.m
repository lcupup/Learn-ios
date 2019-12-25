//
//  LCLearnTableViewCell.m
//  TestScrollView
//
//  Created by 超 on 2019/12/25.
//  Copyright © 2019 chao. All rights reserved.
//

#import "LCLearnTableViewCell.h"
#import <Masonry.h>

@interface  LCLearnTableViewCell()
@property(nonatomic,strong) UILabel * nameLabel;
@property(nonatomic,strong) NSLayoutConstraint * layoutConstraint;
@property(nonatomic,strong) UIView * itemView;


@end
@implementation LCLearnTableViewCell



-(void) setName:(NSString *)name{
    _name=name;
    [ self.contentView addSubview:self.nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo( self.contentView.mas_top).offset(15);
        make.left.equalTo( self.contentView.mas_left).offset(15);
        make.bottom.equalTo( self.contentView.mas_bottom).offset(-5);
        make.right.equalTo( self.contentView.mas_right);
    }];
    [self fillData];
}
-(void) fillData{
    NSLog(@"filldata::::%@",self.name);
    self.nameLabel.text=self.name;
}


-(UILabel *) nameLabel{
    
    if (_nameLabel==nil) {
        _nameLabel=[[UILabel alloc] init];
        _nameLabel.backgroundColor=[UIColor orangeColor];
        _nameLabel.numberOfLines=0;

    }
    
    return _nameLabel;
}

-(UIView *) itemView{
    if (_itemView==nil) {

        _itemView=[[UIView alloc] init];
        _itemView.backgroundColor=[UIColor grayColor];
        [self addSubview:_itemView];
    }
    
    return _itemView;
}
@end
