//
//  MasterViewController.h
//  KeySafe
//
//  Created by Vishnu on 2/20/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleTableViewController.h"
#import "AddEntryViewController.h"
#import <sqlite3.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) TitleTableViewController *titleViewController;
@property (strong, nonatomic) AddEntryViewController *addViewController;
@property (nonatomic) sqlite3 *storePassDB;
@property (strong, nonatomic) NSString * selectedfolderName;



- (IBAction) unwindToList:(UIStoryboardSegue *) segue;


@end

