//
//  SingleComponentViewController.m
//  Pickers
//
//  Created by 康朝芳 on 16/4/6.
//  Copyright © 2016年 kzhf. All rights reserved.
//

#import "SingleComponentViewController.h"

@interface SingleComponentViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong, nonatomic) NSArray *names;

@end

@implementation SingleComponentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.names = @[@"加油", @"奋斗", @"微笑", @"学习", @"前方", @"成功"];
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

#pragma mark 数据源协议方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.names.count;
}

#pragma mark 委托协议的方法
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.names[row];
}

- (IBAction)buttonPress:(UIButton *)sender {
    NSInteger selectRow = [self.singlePicker selectedRowInComponent:0];
    NSString *title = [NSString stringWithFormat:@"Select Row is %@", self.names[selectRow]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:@"Thank you for choosing" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
