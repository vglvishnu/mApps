//
//  DetailViewController.m
//  KeySafe
//
//  Created by Vishnu on 2/20/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import "DetailViewController.h"
#import "SPStoreEntry.h"
#import "AddEntryViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.entry) {
        //self.detailDescriptionLabel.text = [self.detailItem description];
        self.folderLabel.text = [@"Folder  :" stringByAppendingString:self.entry.folderName];
        self.spTitle.text     = [@"Title   :" stringByAppendingString:self.entry.sptitle];
        self.login.text       = [@"Login   :" stringByAppendingString:self.entry.login ];
        self.passWord.text    = [@"PassWord:" stringByAppendingString:self.entry.passWord];
        self.url.text         = [@"URL     :" stringByAppendingString:self.entry.url];
        
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToList:(UIStoryboardSegue *) segue{
    
    AddEntryViewController *addSource = [segue sourceViewController];
    
    if ( addSource.keyEntry) {
        NSLog(@"In detail view Controller");
  
        
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // To populate the screen
    NSLog(@"In detail view Controller");
    
    AddEntryViewController  *addController = (AddEntryViewController  *)[segue destinationViewController] ;
    
    [addController setKeyEntry:self.entry];
    [self configureView];
}

@end
