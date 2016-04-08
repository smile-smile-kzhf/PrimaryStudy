//
//  DoubleComponentViewController.m
//  Pickers
//
//  Created by 康朝芳 on 16/4/6.
//  Copyright © 2016年 kzhf. All rights reserved.
//

#import "DoubleComponentViewController.h"

#define kFirstComponent 0
#define kSecondComponent 1

@interface DoubleComponentViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *doublePicker;
@property (strong, nonatomic) NSArray *arrSheng;
@property (strong, nonatomic) NSArray *arrDishi;

@end

@implementation DoubleComponentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrSheng = @[@"湖南", @"广东"];
    _arrDishi = @[@"长沙", @"邵阳", @"益阳", @"广州", @"深圳", @"佛山", @"珠海"];
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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kFirstComponent) {
        return self.arrSheng.count;
    }
    else {
        return self.arrDishi.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kFirstComponent) {
        return self.arrSheng[row];
    }
    else {
        return self.arrDishi[row];
    }
}



- (IBAction)buttonPress:(UIButton *)sender {
    NSInteger firstRow = [self.doublePicker selectedRowInComponent:kFirstComponent];
    NSInteger secondRow = [self.doublePicker selectedRowInComponent:kSecondComponent];
    
    NSString *title = [NSString stringWithFormat:@"select first row = %@ second row = %@", self.arrSheng[firstRow], self.arrDishi[secondRow]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:@"Thank you for choosing" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
