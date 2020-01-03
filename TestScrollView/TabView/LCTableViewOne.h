//
//  LCTableViewOne.h
//  TestScrollView
//
//  Created by 超 on 2019/12/28.
//  Copyright © 2019 chao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCTableViewOne : UITableView <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSDictionary *dateDic;
@property (nonatomic, assign) NSInteger cellNum;
@end

NS_ASSUME_NONNULL_END
