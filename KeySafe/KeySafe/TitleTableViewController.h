//
//  TitleTableViewController.h
//  StorePass
//
//  Created by Vishnu on 2/18/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPDatasebaseDAO.h"

@interface TitleTableViewController : UITableViewController

@property (strong, nonatomic) id folderName;
@property SPDatasebaseDAO *dbdao;

- (void)setFolderName:(id)newFolderName;
@end
