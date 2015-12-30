//
//  ZHCell.h
//  QiuShiBaiKe
//
//  Created by qianfeng07 on 15/11/28.
//  Copyright © 2015年 JasonZhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHModel.h"

@interface ZHCell : UITableViewCell

@property (nonatomic, assign) CGFloat height;
- (void)updateWithData:(itemsModel *)model;

@end
