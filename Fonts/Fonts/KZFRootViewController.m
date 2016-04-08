//
//  KZFRootViewController.m
//  Fonts
//
//  Created by 康朝芳 on 16/4/8.
//  Copyright © 2016年 kzhf. All rights reserved.
//

#import "KZFRootViewController.h"
#import "KZFFavoritesList.h"
#import "KZFFontListViewController.h"

static NSString *FamilyNameCell = @"FamilyNameCell";
static NSString *FavoritesCell = @"FavoritesCell";

@interface KZFRootViewController ()

@property (copy, nonatomic) NSArray *familyNames;
@property (assign, nonatomic) CGFloat cellPointSize;
@property (strong, nonatomic) KZFFavoritesList *favoritesList;

@end

@implementation KZFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.favoritesList = [KZFFavoritesList shareFavoritesList];
    self.familyNames = [[UIFont familyNames] sortedArrayUsingSelector:@selector(compare:)];
    UIFont *preferredTableViewFont = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.cellPointSize = preferredTableViewFont.pointSize;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (UIFont *)fontForDisplayAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSString *familyName = self.familyNames[indexPath.row];
        NSString *fontName = [[UIFont fontNamesForFamilyName:familyName] firstObject];
        return [UIFont fontWithName:fontName size:self.cellPointSize];
    } else {
        return nil;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    if (self.favoritesList.favorites.count > 0) {
        return 2;
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    if (section == 0) {
        return self.familyNames.count;
    } else {
        return 1;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"All Font Families";
    } else {
        return @"My Favorites Fonts";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:FamilyNameCell forIndexPath:indexPath];
        cell.textLabel.font = [self fontForDisplayAtIndexPath:indexPath];
        cell.textLabel.text = self.familyNames[indexPath.row];
        cell.detailTextLabel.text = self.familyNames[indexPath.row];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:FavoritesCell forIndexPath:indexPath];
    }

    
    return cell;
}

//每个单元指定不同的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UIFont *font = [self fontForDisplayAtIndexPath:indexPath];
        return 25 + font.ascender - font.descender;
    } else {
        return tableView.rowHeight;
    }
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    KZFFontListViewController *fontList = segue.destinationViewController;
    
    if (indexPath.section == 0) {
        NSString *familyName = self.familyNames[indexPath.row];
        fontList.fontNames = [[UIFont fontNamesForFamilyName:familyName] sortedArrayUsingSelector:@selector(compare:)];
        fontList.navigationItem.title = familyName;
        fontList.showsFavorites = NO;
    } else {
        fontList.fontNames = self.favoritesList.favorites;
        fontList.navigationItem.title = @"Favorites";
        fontList.showsFavorites = YES;
    }
 }



@end
