//
//  KZFFontListViewController.m
//  Fonts
//
//  Created by 康朝芳 on 16/4/8.
//  Copyright © 2016年 kzhf. All rights reserved.
//

#import "KZFFontListViewController.h"
#import "KZFFavoritesList.h"
#import "KZFFontSizesViewController.h"
#import "KZFFontInfoViewController.h"

static NSString *FontNameCell = @"FontNameCell";

@interface KZFFontListViewController ()

@property (assign, nonatomic) CGFloat cellPointSize;

@end

@implementation KZFFontListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    if (self.showsFavorites) {
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
    }

    UIFont *preferredTableViewFont = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.cellPointSize = preferredTableViewFont.pointSize;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIFont *)fontForDisplayAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *fontName = self.fontNames[indexPath.row];
    return [UIFont fontWithName:fontName size:self.cellPointSize];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.showsFavorites) {
        self.fontNames = [KZFFavoritesList shareFavoritesList].favorites;
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.fontNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FontNameCell forIndexPath:indexPath];
    
    cell.textLabel.font = [self fontForDisplayAtIndexPath:indexPath];
    cell.textLabel.text = self.fontNames[indexPath.row];
    cell.detailTextLabel.text = self.fontNames[indexPath.row];
    
    return cell;
}

//每个单元指定不同的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIFont *font = [self fontForDisplayAtIndexPath:indexPath];
    return 25 + font.ascender - font.descender;
}


#pragma mark  实现从右到左轻扫删除
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
 // Return NO if you do not want the specified item to be editable.
     return self.showsFavorites;
 }

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.showsFavorites) {
        return;
    }
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSString *favorite = self.fontNames[indexPath.row];
        [[KZFFavoritesList shareFavoritesList] removeFavorite:favorite];
        self.fontNames = [KZFFavoritesList shareFavoritesList].favorites;
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

#pragma mark  实现拖动排序
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [[KZFFavoritesList shareFavoritesList] moveItemAtIndex:fromIndexPath.row toIndex:toIndexPath.row];
    self.fontNames = [KZFFavoritesList shareFavoritesList].favorites;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    UIFont *font = [self fontForDisplayAtIndexPath:indexPath];
    
    if ([segue.identifier isEqualToString:@"showFontSize"]) {
        KZFFontSizesViewController *sizeControl = segue.destinationViewController;
        sizeControl.font = font;
        sizeControl.navigationItem.title = [font fontName];
    } else {
        KZFFontInfoViewController *infoControl = segue.destinationViewController;
        infoControl.font = font;
        infoControl.favorite = [[KZFFavoritesList shareFavoritesList].favorites containsObject:font.fontName];
        infoControl.navigationItem.title = [font fontName];
    }
   
}


@end
