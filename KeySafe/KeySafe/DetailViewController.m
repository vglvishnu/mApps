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
#import "SPDatasebaseDAO.h"

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
        self.folderLabel.textColor = [UIColor greenColor];
        self.folderLabel.text = [@"Folder  :" stringByAppendingString:self.entry.folderName];
        self.spTitle.textColor = [UIColor greenColor];
        self.spTitle.text     = [@"Title   :" stringByAppendingString:self.entry.sptitle];
        self.login.textColor = [UIColor greenColor];
        self.login.text       = [@"Login   :" stringByAppendingString:self.entry.login ];
        self.passWord.textColor = [UIColor greenColor];
        self.passWord.text    = [@"PassWord:" stringByAppendingString:self.entry.passWord];
        self.url.textColor = [UIColor greenColor];
        self.url.text         = [@"URL     :" stringByAppendingString:self.entry.url];
        NSLog(@"id= %@",self.entry.keyid);
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    self.spDAO = [[SPDatasebaseDAO alloc] init];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToList:(UIStoryboardSegue *) segue{
    
    AddEntryViewController *addSource = [segue sourceViewController];
    NSLog(@"here is the id %@ at DetailViewController",self.entry.keyid);
    if ( addSource.keyEntry) {
        NSLog(@"In detail view Controller unwindToList");
        self.entry.folderName = addSource.keyEntry.folderName;
        self.entry.sptitle = addSource.keyEntry.sptitle;
        self.entry.passWord = addSource.keyEntry.passWord;
        self.entry.url = addSource.keyEntry.url;
        self.entry.notes = addSource.keyEntry.notes;
        
        [self configureView];
        
        NSLog(@"here is the id %@",self.entry.keyid);
        [self.spDAO updateSPEntryToDB:self.entry];
        
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
