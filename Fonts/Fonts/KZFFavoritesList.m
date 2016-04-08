//
//  KZFFavoritesList.m
//  Fonts
//
//  Created by 康朝芳 on 16/4/7.
//  Copyright © 2016年 kzhf. All rights reserved.
//

#import "KZFFavoritesList.h"

@interface KZFFavoritesList ()

@property (strong, nonatomic) NSMutableArray *favorites;
@end

@implementation KZFFavoritesList

+ (instancetype)shareFavoritesList
{
    static KZFFavoritesList *share = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        share = [[self alloc] init];
    });
    
    return share;
}

- (instancetype)init
{
    if (self = [super init]) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSArray *storedFavorites = [defaults objectForKey:@"favorites"];
        if (storedFavorites) {
            self.favorites = [storedFavorites mutableCopy];
        } else {
            self.favorites = [NSMutableArray array];
        }
    }
    
    return self;
}

- (void)addFavorite:(id)item
{
    [_favorites insertObject:item atIndex:0];
    [self saveFavorites];
}

- (void)removeFavorite:(id)item
{
    [_favorites removeObject:item];
    [self saveFavorites];
}

- (void)saveFavorites
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.favorites forKey:@"favorites"];
    [defaults synchronize];
}

- (void)moveItemAtIndex:(NSInteger)from toIndex:(NSInteger)to
{
    id item = _favorites[from];
    [_favorites removeObject:item];
    [_favorites insertObject:item atIndex:to];
    [self saveFavorites];
}

@end
