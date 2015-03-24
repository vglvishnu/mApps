//
//  MasterViewController.m
//  KeySafe
//
//  Created by Vishnu on 2/20/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AddEntryViewController.h"
#import "SPStoreEntry.h"
#import "SPDatasebaseDAO.h"
#import "TitleTableViewController.h"
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

@interface MasterViewController ()

@property NSMutableArray *objects;
@property NSMutableArray *folderItems;
@property NSArray *dirPaths;
@property NSString *databasePath;
@property NSString *docDir;
@property SPStoreEntry *storeEntry;
@property NSMutableArray *keyEntries;
@property NSMutableArray *spfolders;
@property SPDatasebaseDAO *dbdao;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.keyEntries =[[NSMutableArray alloc] init];
    
    self.spfolders = [[NSMutableArray alloc]init];
    
    _dbdao = [[SPDatasebaseDAO alloc]init];
    
    [_dbdao createDBIfNotExists];
    [self.keyEntries addObjectsFromArray:[_dbdao getEntriesFromDB]];
    [self.spfolders addObjectsFromArray:[_dbdao getFoldersFromDB]];
//    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
//    [[UINavigationBar appearance] setBackgroundColor:[UIColor blackColor]];
    self.view.backgroundColor = Rgb2UIColor(255, 255, 255);
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.backgroundColor = [UIColor grayColor];
    self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem.tintColor = Rgb2UIColor(255, 253, 208);

    self.navigationController.navigationBar.tintColor = Rgb2UIColor(255, 253, 208);
   
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSMutableDictionary dictionaryWithObjectsAndKeys:[UIFont
                                                                                                     fontWithName:@"HelveticaNeue-Light" size:20], NSFontAttributeName,
                                                          Rgb2UIColor(255, 253, 208)
, NSForegroundColorAttributeName, nil]];
    self.tableView.backgroundColor = Rgb2UIColor(255, 253, 250);
    

    // Do any additional setup after loading the view, typically from a nib.
   // self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
//    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)insertNewObject:(id)sender {
//    if (!self.objects) {
//        self.objects = [[NSMutableArray alloc] init];
//    }
//    [self.objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = self.objects[indexPath.row];
//        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
//        [controller setDetailItem:object];
//        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//        controller.navigationItem.leftItemsSupplementBackButton = YES;
//    }
    
    
    if ([[segue identifier] isEqualToString:@"showTitle"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        self.selectedfolderName  = self.spfolders[indexPath.row];
        id folder = self.selectedfolderName  = self.spfolders[indexPath.row];
    
        self.titleViewController = (TitleTableViewController  *)[[segue destinationViewController] topViewController];
        [self.titleViewController setFolderName:folder];
        [self.titleViewController setSpAllEntries:self.keyEntries];
        [self.titleViewController setSpDAO:_dbdao];
        NSPredicate *folderpredicate = [NSPredicate predicateWithFormat:@"folderName = %@", folder];

     
        //[self.titleViewController setDbdao:self.dbdao];
        [self.titleViewController setSpSelectedEntries:(NSMutableArray *)[self.keyEntries filteredArrayUsingPredicate:folderpredicate]];
        //controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
       // controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.spfolders.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MasterCell" forIndexPath:indexPath];

    NSDate *object = self.spfolders[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = [object description];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.textLabel.backgroundColor =[UIColor whiteColor];
    cell.imageView.backgroundColor =[UIColor whiteColor];
    //cell.imageView.frame = CGRectMake(45.0,10.0,10,10);
    
    //cell.textLabel.textColor = [UIColor colorWithRed:(160/255.0) green:(200/255.0) blue:(150/255.0) alpha:1];
    //cell.textLabel.textColor = [UIColor colorWithRed:(255/255.0) green:(253/255.0) blue:(208/255.0) alpha:1];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (IBAction) unwindToList:(UIStoryboardSegue *) segue{
    
    AddEntryViewController *addSource = [segue sourceViewController];
     NSLog(@"unwindToList MasterViewController");
     NSLog(@"addSource.keyEntry %@",addSource.keyEntry);
    if ( addSource.keyEntry) {
        NSLog(@"Insert in entry Table");
        
        [self.keyEntries addObject:addSource.keyEntry];
        [self updateSPFolderObject:addSource.keyEntry.folderName];
        
        [self.tableView reloadData];
        [self.dbdao insertSPEntryToDB:addSource.keyEntry];
        
    }
    
}

-(void) updateSPFolderObject:(NSString *) folderName {
    
    if(self.spfolders.count == 0) {
        [self.spfolders addObject:folderName];
    }
    
    if([self.spfolders indexOfObject:folderName] == NSNotFound) {
        [self.spfolders addObject:folderName];
        
    } else {
        NSLog(@"<<<<<<Folder  %@ already exists >>>>>>>>", folderName);
    }
    
}

@end
