//
//  DataSource.h
//  TestScrollView
//
//  Created by 超 on 2019/12/31.
//  Copyright © 2019 chao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataSource : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *buyCount;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)tgWithDict:(NSDictionary *)dict;

+ (NSMutableArray *)tgs;

@end

NS_ASSUME_NONNULL_END
