//
//  DetailViewController.h
//  KeySafe
//
//  Created by Vishnu on 2/20/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPStoreEntry.h"


@interface DetailViewController : UIViewController



@property (strong, nonatomic) id detailItem;

@property SPStoreEntry *entry;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *folderLabel;

@property (weak, nonatomic) IBOutlet UITextField *spTitle;
@property (weak, nonatomic) IBOutlet UITextField *login;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextField *url;
@property (weak, nonatomic) IBOutlet UITextView *notes;

@end

