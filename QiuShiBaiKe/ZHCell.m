//
//  ZHCell.m
//  QiuShiBaiKe
//
//  Created by qianfeng07 on 15/11/28.
//  Copyright © 2015年 JasonZhang. All rights reserved.
//

#import "ZHCell.h"

@interface ZHCell ()
@property (weak, nonatomic) IBOutlet UILabel *storyLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *downLabel;
@property (weak, nonatomic) IBOutlet UIImageView *goodLabel;
@property (weak, nonatomic) IBOutlet UIImageView *badLabel;

@property (weak, nonatomic) IBOutlet UIImageView *speakLabel;
@property (weak, nonatomic) IBOutlet UIImageView *good;

@property (weak, nonatomic) IBOutlet UIImageView *speak;
@property (weak, nonatomic) IBOutlet UILabel *goodCount;

@property (weak, nonatomic) IBOutlet UILabel *speakCount;
@property (weak, nonatomic) IBOutlet UIImageView *myLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bad;

@property (weak, nonatomic) IBOutlet UILabel *badCount;



@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;


@end

@implementation ZHCell


- (void)updateWithData:(itemsModel *)model
{
    self.nameLabel.text = model.user.login;
    self.storyLabel.text = model.content;
    self.storyLabel.numberOfLines = 0;
    self.storyLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize size = [self.storyLabel sizeThatFits:CGSizeMake(self.storyLabel.frame.size.width, MAXFLOAT)];
    self.storyLabel.frame = CGRectMake(self.storyLabel.frame.origin.x, self.storyLabel.frame.origin.y, self.storyLabel.frame.size.width, size.height);
    self.height = size.height;
    
    CGFloat height1;
    CGFloat height2;
    if (!model.image) {
        height1 = 240;
        height2 = 105;
        self.titleImageView.frame = CGRectMake(self.storyLabel.frame.origin.x, self.storyLabel.frame.origin.y + self.storyLabel.frame.size.height + 10, self.titleImageView.frame.size.width, self.titleImageView.frame.size.height);
        self.titleImageView.hidden = YES;
    } else {
        height1 = 180;
        height2 = 45;
        self.titleImageView.hidden = YES;
    }
    
    
    self.storyLabel.frame = CGRectMake(self.storyLabel.frame.origin.x, self.storyLabel.frame.origin.y, self.storyLabel.frame.size.width, size.height);
    self.height = self.storyLabel.frame.size.height + height1;
    
    CGPoint center = self.downLabel.center;
    center.y = self.height - self.downLabel.frame.size.height + 10;
    self.downLabel.center = center;
    
    self.goodLabel.frame = CGRectMake(self.goodLabel.frame.origin.x, self.storyLabel.frame.origin.y + self.storyLabel.frame.size.height + height2, self.goodLabel.frame.size.width, self.goodLabel.frame.size.height);
    
    self.badLabel.frame = CGRectMake(self.badLabel.frame.origin.x, self.storyLabel.frame.origin.y + self.storyLabel.frame.size.height + height2, self.badLabel.frame.size.width, self.badLabel.frame.size.height);
    
    self.speakLabel.frame = CGRectMake(self.speakLabel.frame.origin.x, self.storyLabel.frame.origin.y + self.storyLabel.frame.size.height + height2, self.speakLabel.frame.size.width, self.speakLabel.frame.size.height);
    
    self.good.frame = CGRectMake(self.good.frame.origin.x, self.storyLabel.frame.origin.y + self.storyLabel.frame.size.height + height2, self.good.frame.size.width, self.good.frame.size.height);
    
    self.goodCount.frame = CGRectMake(self.goodCount.frame.origin.x, self.storyLabel.frame.origin.y + self.storyLabel.frame.size.height + height2, self.goodCount.frame.size.width, self.goodCount.frame.size.height);
    
    self.bad.frame = CGRectMake(self.bad.frame.origin.x, self.storyLabel.frame.origin.y + self.storyLabel.frame.size.height + height2, self.bad.frame.size.width, self.bad.frame.size.height);

    self.badCount.frame = CGRectMake(self.badCount.frame.origin.x, self.storyLabel.frame.origin.y + self.storyLabel.frame.size.height + height2, self.badCount.frame.size.width, self.badCount.frame.size.height);

    self.speak.frame = CGRectMake(self.speak.frame.origin.x, self.storyLabel.frame.origin.y + self.storyLabel.frame.size.height + height2, self.speak.frame.size.width, self.speak.frame.size.height);
    
    self.speakCount.frame = CGRectMake(self.speakCount.frame.origin.x, self.storyLabel.frame.origin.y + self.storyLabel.frame.size.height + height2, self.speakCount.frame.size.width, self.speakCount.frame.size.height);
    
    self.myLabel.frame = CGRectMake(self.myLabel.frame.origin.x, self.storyLabel.frame.origin.y + self.storyLabel.frame.size.height + height2, self.myLabel.frame.size.width, self.myLabel.frame.size.height);
        
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
