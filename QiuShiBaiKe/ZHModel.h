//
//  ZHModel.h
//  QiuShiBaiKe
//
//  Created by qianfeng07 on 15/11/29.
//  Copyright © 2015年 JasonZhang. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@interface votesModel : JSONModel
@property (nonatomic, copy) NSString *up;
@property (nonatomic, copy) NSString *down;
@end



@interface imageSizeModel : JSONModel
@property (nonatomic, strong) NSMutableArray *s;
@property (nonatomic, strong) NSMutableArray *m;
@end


@interface userModel : JSONModel
@property (nonatomic, copy) NSString *login;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *avatar_updated_at;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, copy) NSString *role;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString<Optional> *email;
@property (nonatomic, copy) NSString *last_device;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *last_visited_at;
@end

@protocol itemsModel
@end
@interface itemsModel : JSONModel
@property (nonatomic, copy) NSString *published_at;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString<Optional> *tag;
@property (nonatomic, copy) NSString<Optional> *image;
@property (nonatomic, copy) NSString *format;
@property (nonatomic, copy) NSString *allow_comment;
@property (nonatomic, copy) NSString *comments_count;
@property (nonatomic, copy) NSString *share_count;
@property (nonatomic, copy) userModel<Optional> *user;
@property (nonatomic, copy) imageSizeModel<Optional> *image_size;
@property (nonatomic, copy) votesModel *votes;
@end


@interface ZHModel : JSONModel
@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString<Optional> *err;
@property (nonatomic, copy) NSString *total;
@property (nonatomic, copy) NSString *page;
@property (nonatomic, copy) NSString<Optional> *refresh;
@property (nonatomic, strong) NSMutableArray<itemsModel> *items;
@end
