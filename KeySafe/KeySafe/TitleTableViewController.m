//
//  TitleTableViewController.m
//  StorePass
//
//  Created by Vishnu on 2/18/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import "TitleTableViewController.h"
#import "SPDatasebaseDAO.h"
#import "DetailViewController.h"
#import "AddEntryViewController.h"
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

@interface TitleTableViewController ()
   @property DetailViewController *detailViewController;
   @property AddEntryViewController *addEntryViewController;
   @property BOOL dataHasChanged;
   @property BOOL scrollToLast;


@end

@implementation TitleTableViewController



- (void)setFolderName:(id)newFolderName {
    
    NSLog(@" We are at SetFolder");
    if (_folderName != newFolderName) {
        _folderName = newFolderName;
        
        // Update the view.
        
    }
}

-(void) updateSpSelectedEntriesCollection :(NSArray *) spEntries {
    
    for (SPStoreEntry *entrie in spEntries) {
        
        if([self.spSelectedEntries indexOfObject:entrie] == NSNotFound) {
            
            [self.spSelectedEntries addObject:entrie];
        }
        
    }
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
  //  [[UINavigationBar appearance]
   //  setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor greenColor]}];
    UIEdgeInsets inset = UIEdgeInsetsMake(70, 0, 0, 0);
    self.tableView.contentInset = inset;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.rightBarButtonItem.tintColor = Rgb2UIColor(255, 253, 208);
    self.navigationItem.leftBarButtonItem.tintColor = Rgb2UIColor(255, 253, 208);
    self.tableView.backgroundColor = Rgb2UIColor(255, 253, 250);
      
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
    return self.spSelectedEntries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleCell" forIndexPath:indexPath];
    
    SPStoreEntry *spEntry = self.spSelectedEntries[indexPath.row];
    
    cell.textLabel.text = spEntry.sptitle;
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.contentView.backgroundColor = Rgb2UIColor(255, 253, 250);
    cell.textLabel.backgroundColor =[UIColor whiteColor];
    cell.textLabel.textColor =  Rgb2UIColor(0, 0, 0);
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([[segue identifier] isEqualToString:@"addTitle"]) {
        self.addEntryViewController = (AddEntryViewController  *)[segue destinationViewController] ;
        
        SPStoreEntry *keyEntry = [SPStoreEntry createSPEntry:self.folderName sptitle:nil login:nil passWord:nil url:nil notes:nil keyid:nil];
        [self.addEntryViewController setKeyEntry:keyEntry];
    }
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    self.detailViewController = (DetailViewController  *)[[segue destinationViewController] topViewController];
    [self.detailViewController setEntry:self.spSelectedEntries[indexPath.row]];
    [self.detailViewController setSpDAO:self.spDAO];
    }
    
    
}

- (IBAction) unwindToList:(UIStoryboardSegue *) segue{
    
    AddEntryViewController *addSource = [segue sourceViewController];
    NSLog(@"unwindToList TitleViewController");
    NSLog(@"addSource.keyEntry %@",addSource.keyEntry);
    
    if ( addSource.keyEntry && addSource.keyEntry.sptitle) {
        NSLog(@"Insert in entry Table");
        [self.spAllEntries addObject:addSource.keyEntry];
        NSLog(@"Count= %lu",(unsigned long)self.spSelectedEntries.count);
         //TODO: to be fixed
        NSPredicate *folderpredicate = [NSPredicate predicateWithFormat:@"folderName = %@", self.folderName];
        [self setSpSelectedEntries:(NSMutableArray *)[self.spAllEntries filteredArrayUsingPredicate:folderpredicate]];
        
        NSLog(@"Count= %lu",(unsigned long)self.spSelectedEntries.count);
        [self.tableView reloadData];
        [self.spDAO insertSPEntryToDB:addSource.keyEntry];
        

    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.dataHasChanged) {
        self.dataHasChanged = NO;
        [[self tableView] reloadData];
    } else {
        self.scrollToLast = NO; // No reload -> no need to scroll!
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.scrollToLast) {
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:(self.spSelectedEntries.count - 1) inSection:0];
        [[self tableView] scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}

@end
