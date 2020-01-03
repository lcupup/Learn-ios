    //
    //  ContentTableView.m
    //  TestScrollView
    //
    //  Created by 超 on 2020/1/2.
    //  Copyright © 2020 chao. All rights reserved.
    //

    #import "ContentTableView.h"
#import "ContentTableViewCell.h"
@interface  ContentTableView()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation ContentTableView
    -(instancetype) initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
        if (self=[super initWithFrame:frame
                                style:style]) {
            self.delegate=self;
            self.dataSource=self;
            self.backgroundColor=[UIColor grayColor];
         
        }
        
        return self;
    }

- (void)setData:(NSMutableArray *)data{
    
    _data=data;
    [self reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID=@"cell";
    ContentTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[ContentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: ID];
    }
    [cell setData:_data[indexPath.row]];
    
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _data.count;
}

    @end
