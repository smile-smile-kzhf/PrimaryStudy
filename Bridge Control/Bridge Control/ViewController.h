//
//  ViewController.h
//  Bridge Control
//
//  Created by 康朝芳 on 16/4/11.
//  Copyright © 2016年 kzhf. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "KZFFlipsideViewController.h"

#define kOfficerKey                    @"name"
#define kAuthorizationCodeKey          @"pwd"
#define kRankKey                       @"sex"
#define kWarpDriveKey                  @"key11"
#define kWarpFactorKey                 @"age"
#define kFavoriteTeaKey                @"favoriteTea"
#define kFavoriteCaptainKey            @"favoriteCaptain"
#define kFavoriteGadgetKey             @"favoriteGadget"
#define kFavoriteAlienKey              @"favoriteAlien"

@interface ViewController : UIViewController <FlipsideViewControllerDelegate>


@end

