//
//  CustomPickerViewController.m
//  Pickers
//
//  Created by 康朝芳 on 16/4/6.
//  Copyright © 2016年 kzhf. All rights reserved.
//

#import "CustomPickerViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface CustomPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *customPicker;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) NSArray *images;

@end

@implementation CustomPickerViewController
{
    SystemSoundID winSoundID;
    SystemSoundID crunchSoundID;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.images = @[[UIImage imageNamed:@"seven"],
                    [UIImage imageNamed:@"bar"],
                    [UIImage imageNamed:@"crown"],
                    [UIImage imageNamed:@"cherry"],
                    [UIImage imageNamed:@"lemon"],
                    [UIImage imageNamed:@"apple"],
                    ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.images.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIImage *image = self.images[row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    return imageView;
}

- (IBAction)buttomPress:(UIButton *)sender {
    BOOL win = NO;
    int numInRow = 1;
    int lastVal = -1;
    for (int i = 0; i < 5; ++i) {
        //获取随机数
        int newValue = arc4random_uniform((u_int32_t)_images.count);
        
        if (newValue == lastVal) {
            numInRow++;
        }
        else {
            numInRow = 1;
        }
        lastVal = newValue;
        
        [self.customPicker selectRow:newValue inComponent:i animated:YES];
        [self.customPicker reloadComponent:i];
        
        if (numInRow >= 3) {
            win = YES;
        }
    }
    
    if (crunchSoundID == 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"wav"];
        NSURL *url = [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &crunchSoundID);
    }
    AudioServicesPlaySystemSound(crunchSoundID);
    
    if (win) {
        [self performSelector:@selector(playWithSound) withObject:nil afterDelay:0.5];
    }
    else {
        [self performSelector:@selector(showButton) withObject:nil afterDelay:0.5];
    }
    
    self.button.hidden = YES;
    self.label.text = @"";
}

- (void)showButton
{
    self.button.hidden = NO;
}

- (void)playWithSound
{
    if (winSoundID == 0) {
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &winSoundID);
    }
    AudioServicesPlaySystemSound(winSoundID);
    self.label.text = @"WINNING!";
    [self performSelector:@selector(showButton) withObject:nil afterDelay:1.5];
}

@end
