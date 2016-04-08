//
//  KZFFontListViewController.h
//  Fonts
//
//  Created by 康朝芳 on 16/4/8.
//  Copyright © 2016年 kzhf. All rights reserved.
//  Des：字体列表视图（第一个字控制器）
//       针对收藏的字体：能进行编辑：从右到左轻扫删除、拖动排序

#import <UIKit/UIKit.h>

@interface KZFFontListViewController : UITableViewController

@property (copy, nonatomic) NSArray *fontNames;
@property (assign, nonatomic) BOOL showsFavorites;

@end
