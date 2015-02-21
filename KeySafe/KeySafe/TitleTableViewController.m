//
//  TitleTableViewController.m
//  StorePass
//
//  Created by Vishnu on 2/18/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import "TitleTableViewController.h"
#import "SPDatasebaseDAO.h"

@interface TitleTableViewController ()
@property NSMutableArray *spAllEntries;
@property NSMutableArray *spselectedEntries;


@end

@implementation TitleTableViewController



- (void)setFolderName:(id)newFolderName {
    
    NSLog(@" We are at SetFolder");
    if (_folderName != newFolderName) {
        _folderName = newFolderName;
        
        // Update the view.
        
    }
}




- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Title view Controller");
    //self.dbdao = [[SPDatasebaseDAO alloc] init];
    self.spAllEntries  =[[NSMutableArray alloc] init];
    self.spAllEntries  = [self.dbdao getEntriesFromDB];
    self.spselectedEntries  =[[NSMutableArray alloc] init];
    NSPredicate *folderpredicate = [NSPredicate predicateWithFormat:@"folderName = %@", self.folderName];
    [self.spselectedEntries addObjectsFromArray:[self.spAllEntries filteredArrayUsingPredicate:folderpredicate]];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.spselectedEntries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleCell" forIndexPath:indexPath];
    
    SPStoreEntry *spEntry = self.spselectedEntries[indexPath.row];
    
    cell.textLabel.text = spEntry.sptitle;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
