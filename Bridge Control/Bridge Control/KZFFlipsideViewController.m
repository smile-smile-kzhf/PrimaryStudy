//
//  KZFFlipsideViewController.m
//  Bridge Control
//
//  Created by 康朝芳 on 16/4/11.
//  Copyright © 2016年 kzhf. All rights reserved.
//

#import "KZFFlipsideViewController.h"
#import "ViewController.h"

@interface KZFFlipsideViewController ()

@end

@implementation KZFFlipsideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self refreshFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Actions
- (IBAction)done:(id)sender
{
    //通过代理协议通知父视图翻转视图已完成
    [self.delegate flipsideViewControllerDidFinish:self];
}


- (void)refreshFields
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.engineSwitch.on = [defaults boolForKey:kWarpDriveKey];
    self.warpFactorSlider.value = [defaults floatForKey:kWarpFactorKey];
}

- (IBAction)engineSwitchTapped
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.engineSwitch.on forKey:kWarpDriveKey];
    [defaults synchronize];

}
- (IBAction)warpSliderTouched
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:self.warpFactorSlider.value forKey:kWarpFactorKey];
    [defaults synchronize];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //订阅通知，并告诉通知中心在通知出现的时候调用某方法
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
}

- (void)applicationWillEnterForeground:(NSNotification *)notification
{
    if (notification.object && [notification.name isEqualToString:UIApplicationWillEnterForegroundNotification]) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        //强制它重新读取已保存的偏好设置，从而获得设置应用中所做的修改
        [defaults synchronize];
        //更新界面
        [self refreshFields];
    }
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //移除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
