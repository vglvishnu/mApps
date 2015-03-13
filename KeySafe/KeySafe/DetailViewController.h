//
//  DetailViewController.h
//  KeySafe
//
//  Created by Vishnu on 2/20/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPStoreEntry.h"
#import "SPDatasebaseDAO.h"


@interface DetailViewController : UIViewController



@property (strong, nonatomic) id detailItem;

@property SPStoreEntry *entry;
@property SPDatasebaseDAO *spDAO;



- (IBAction) unwindToList:(UIStoryboardSegue *) segue;



@end

