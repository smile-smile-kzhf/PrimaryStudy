//
//  KZFFavoritesList.h
//  Fonts
//
//  Created by 康朝芳 on 16/4/7.
//  Copyright © 2016年 kzhf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KZFFavoritesList : NSObject

+ (instancetype)shareFavoritesList;
- (NSArray *)favorites;

- (void)addFavorite:(id)item;
- (void)removeFavorite:(id)item;

- (void)moveItemAtIndex:(NSInteger)from toIndex:(NSInteger)to;
@end
