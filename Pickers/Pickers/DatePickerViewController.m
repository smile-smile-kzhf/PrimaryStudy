//
//  DatePickerViewController.m
//  Pickers
//
//  Created by 康朝芳 on 16/4/6.
//  Copyright © 2016年 kzhf. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDate *now = [NSDate date];
    [self.datePicker setDate:now];
    [self.datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans_CN"]];
    [self.datePicker setDatePickerMode:UIDatePickerModeDate];
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
- (IBAction)buttonPress:(UIButton *)sender {
    
    NSString *selectDate = [NSString stringWithFormat:@"%@", self.datePicker.date];
//    NSDateFormatter 
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Data and Time Select" message:selectDate preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
