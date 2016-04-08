//
//  KZFFontInfoViewController.h
//  Fonts
//
//  Created by 康朝芳 on 16/4/8.
//  Copyright © 2016年 kzhf. All rights reserved.
//  DES：查看字体形态详情（注意各个控件的约束）

#import <UIKit/UIKit.h>

@interface KZFFontInfoViewController : UIViewController

@property(strong, nonatomic) UIFont *font;
@property(assign, nonatomic) BOOL favorite;

@end
