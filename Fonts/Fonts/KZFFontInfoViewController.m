//
//  KZFFontInfoViewController.m
//  Fonts
//
//  Created by 康朝芳 on 16/4/8.
//  Copyright © 2016年 kzhf. All rights reserved.
//

#import "KZFFontInfoViewController.h"
#import "KZFFavoritesList.h"

@interface KZFFontInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *fontSampleLabel;
@property (weak, nonatomic) IBOutlet UISlider *fontSizeSlider;
@property (weak, nonatomic) IBOutlet UILabel *fontSizeLabel;
@property (weak, nonatomic) IBOutlet UISwitch *favoriteSwitch;

@end

@implementation KZFFontInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fontSampleLabel.font = self.font;
    self.fontSampleLabel.text = @"AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVv"
    "WwXxYyZz 0123456789";
    self.fontSizeSlider.value = self.font.pointSize;
    self.fontSizeLabel.text = [NSString stringWithFormat:@"%.f", self.font.pointSize];
    self.favoriteSwitch.on = self.favorite;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)slideFontSize:(UISlider *)sender {
    float newSize = roundf(sender.value);
    self.fontSampleLabel.font = [self.font fontWithSize:newSize];
    self.fontSizeLabel.text = [NSString stringWithFormat:@"%.f", newSize];
}
- (IBAction)toggleFavorite:(UISwitch *)sender {
    KZFFavoritesList *favoritesList = [KZFFavoritesList shareFavoritesList];
    if (sender.on) {
        [favoritesList addFavorite:self.font.fontName];
    } else {
        [favoritesList removeFavorite:self.font.fontName];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
