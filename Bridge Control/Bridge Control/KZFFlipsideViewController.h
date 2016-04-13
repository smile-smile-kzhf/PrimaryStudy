//
//  KZFFlipsideViewController.h
//  Bridge Control
//
//  Created by 康朝芳 on 16/4/11.
//  Copyright © 2016年 kzhf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KZFFlipsideViewController;
//构造一个翻转视图控制器代理协议，功能是翻转视图完成以后通知父视图
@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(KZFFlipsideViewController *)controller;
@end

@interface KZFFlipsideViewController : UIViewController

//对实现翻转视图控制器代理协议对象的应用属性
@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UISwitch *engineSwitch;
@property (weak, nonatomic) IBOutlet UISlider *warpFactorSlider;

- (void)refreshFields;
- (IBAction)engineSwitchTapped;
- (IBAction)warpSliderTouched;

//导航栏中Done按钮的操作方法
- (IBAction)done:(id)sender;

@end
