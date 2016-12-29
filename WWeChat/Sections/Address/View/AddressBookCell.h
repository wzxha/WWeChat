//
//  AddressBookCell.h
//  WWeChat
//
//  Created by WzxJiang on 16/7/1.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressBookModel.h"

@interface AddressBookCell : UITableViewCell

@property (nonatomic, strong)  UIImageView * avaterView;
@property (nonatomic, strong)  UILabel * nickNameLabel;

- (void)setModel:(AddressBookModel *)model;

@end
