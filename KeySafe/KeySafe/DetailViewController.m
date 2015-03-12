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
//        self.folderLabel.text = [[[NSString stringWithFormat:@"%@%*s", @"Folder",20 - @"Folder".length,"" ] stringByAppendingString:@": "] stringByAppendingString:self.entry.folderName];
        self.folderLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.folderLabel.numberOfLines = 0;
        self.folderLabel.text = [[@"Folder" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.folderName];
        CGSize labelSize = [self.folderLabel.text sizeWithAttributes:@{NSFontAttributeName:self.folderLabel.font}];
        self.folderLabel.frame = CGRectMake(
                                 self.folderLabel.frame.origin.x, self.folderLabel.frame.origin.y,
                                 self.folderLabel.frame.size.width, labelSize.height);
        UITextView *folderTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        [folderTextView setFrame:CGRectMake(20, 50, 320.0, 200)];
        [folderTextView setText:[[@"Folder" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.folderName]];
        self.spTitle.textColor = [UIColor greenColor];
        self.spTitle.text = [[[NSString stringWithFormat:@"%@%*s", @"Title",20 - @"Title".length,"" ] stringByAppendingString:@": "] stringByAppendingString:self.entry.sptitle];
        
        //self.spTitle.text     = [@"Title   :" stringByAppendingString:self.entry.sptitle];
        self.login.textColor = [UIColor greenColor];
        self.login.text = [[[NSString stringWithFormat:@"%@%*s", @"Login",20 - @"Login".length,"" ] stringByAppendingString:@": "] stringByAppendingString:self.entry.login];
       // self.login.text       = [@"Login   :" stringByAppendingString:self.entry.login ];
        self.passWord.textColor = [UIColor greenColor];
        self.passWord.text = [[[NSString stringWithFormat:@"%@%*s", @"Secret",20 - @"Secret".length,"" ] stringByAppendingString:@": "] stringByAppendingString:self.entry.passWord];
       // self.passWord.text    = [@"Secret  :" stringByAppendingString:self.entry.passWord];
        self.url.textColor = [UIColor greenColor];
        self.url.text = [[[NSString stringWithFormat:@"%@%*s", @"url",20 - @"url".length,"" ] stringByAppendingString:@": "] stringByAppendingString:self.entry.url];

        //self.url.text         = [@"url     :" stringByAppendingString:self.entry.url];
        NSLog(@"id= %@",self.entry.keyid);
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor greenColor];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor greenColor];

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
