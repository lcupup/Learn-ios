//
//  DataSource.m
//  TestScrollView
//
//  Created by 超 on 2019/12/31.
//  Copyright © 2019 chao. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)tgWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSMutableArray *)tgs
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject: dict];
    }
    
    return arrayM;
}


@end
