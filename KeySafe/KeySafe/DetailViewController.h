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

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *folderLabel;
@property (weak, nonatomic) IBOutlet UILabel *spTitle;

@property (weak, nonatomic) IBOutlet UILabel *login;
@property (weak, nonatomic) IBOutlet UILabel *passWord;

@property (weak, nonatomic) IBOutlet UILabel *url;

- (IBAction) unwindToList:(UIStoryboardSegue *) segue;



@end

