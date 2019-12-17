//
//  NetWorkManager.m
//  TestScrollView
//
//  Created by 超 on 2019/12/17.
//  Copyright © 2019 chao. All rights reserved.
//

#import "NetWorkManager.h"
#define IOS_SERVER_BASE_URL @"http://192.168.3.253:8080";


@implementation NetWorkManager
+(void) setup{
    [XMCenter setupConfig:^(XMConfig * _Nonnull config) {
        config.generalServer=IOS_SERVER_BASE_URL;
        config.callbackQueue=dispatch_get_main_queue();
        config.consoleLog=YES;
        config.generalHeaders=@{@"Accept":@"application/json"};
    }];
    [XMCenter setResponseProcessBlock:^id(XMRequest * _Nonnull request, id  _Nullable responseObject, NSError * _Nullable __autoreleasing * _Nullable error) {

        if ([responseObject isKindOfClass:[NSDictionary class]] &&[[responseObject allKeys]count]>0) {
            return responseObject;
            
            //            NSInteger code =[responseObject[@"code"] integerValue ];
//            NSLog(@"networkcode%ld",code);
//            if (code) {
//                <#statements#>
//            }
        }
        return nil;
        
        
    }];
    
    
}

@end
