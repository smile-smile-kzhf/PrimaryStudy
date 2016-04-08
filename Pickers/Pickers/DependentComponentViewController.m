//
//  DependentComponentViewController.m
//  Pickers
//
//  Created by 康朝芳 on 16/4/6.
//  Copyright © 2016年 kzhf. All rights reserved.
//

#import "DependentComponentViewController.h"

#define kStateComponent 0
#define kZipComponent 1

@interface DependentComponentViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *doublePicker;
@property (strong, nonatomic) NSDictionary *stateZips;
@property (strong, nonatomic) NSArray *states;
@property (strong, nonatomic) NSArray *zips;

@end

@implementation DependentComponentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSBundle *bundle = [NSBundle mainBundle];
    
//    NSString *path = [bundle pathForResource:@"statedictionary" ofType:@"plist"];
//    self.stateZips = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSURL *url = [bundle URLForResource:@"statedictionary" withExtension:@"plist"];
    self.stateZips = [NSDictionary dictionaryWithContentsOfURL:url];
    
    NSArray *keys = [_stateZips allKeys];
    self.states = [keys sortedArrayUsingSelector:@selector(compare:)];
    self.zips = self.stateZips[_states[0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 数据源协议方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kStateComponent) {
        return self.states.count;
    }
    else {
        return self.zips.count;
    }
}

#pragma mark 委托协议的方法
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kStateComponent) {
        return self.states[row];
    }
    else {
        return self.zips[row];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == kStateComponent) {
        return 200;
    }
    else {
        return 90;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == kStateComponent) {
        self.zips = self.stateZips[_states[row]];
        
        [self.doublePicker reloadComponent:kZipComponent];
        [self.doublePicker selectRow:0 inComponent:kZipComponent animated:YES];
    }
}



- (IBAction)buttonPress:(UIButton *)sender {
    
    NSInteger firstRow = [self.doublePicker selectedRowInComponent:kStateComponent];
    NSInteger secondRow = [self.doublePicker selectedRowInComponent:kZipComponent];
    
    NSString *title = [NSString stringWithFormat:@"select first row = %@ second row = %@", self.states[firstRow], self.zips[secondRow]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:@"Thank you for choosing" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
