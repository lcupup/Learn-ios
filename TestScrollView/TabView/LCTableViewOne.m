//
//  LCTableViewOne.m
//  TestScrollView
//
//  Created by 超 on 2019/12/28.
//  Copyright © 2019 chao. All rights reserved.
//

#import "LCTableViewOne.h"

@implementation LCTableViewOne

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        
    
    }
    
    return self;
}

- (void)setDateDic:(NSDictionary *)dateDic {
    if (dateDic) {
        _dateDic = dateDic;
        [self reloadData];
    }
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
//    
//    
//    
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return _cellNum;
    
    
}



@end
