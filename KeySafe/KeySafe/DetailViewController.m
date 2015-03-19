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
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

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
        
        
        UIFont *detailFont = [UIFont fontWithName:@"Helvetica Neue" size:17];
        UIColor *creamColor = Rgb2UIColor(255, 253, 208);
        UIColor *grayColor  = [UIColor grayColor];
        UIColor *foregroundColor = [UIColor whiteColor];
        UIFont *boldFontName = [UIFont fontWithName:@"Helvetica-Bold" size:17];
        
        //TODO: Yet to figure out this
        UITextView *dummyTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        dummyTextView.userInteractionEnabled = NO;
        [dummyTextView setFrame:CGRectMake(31, 50, 290, 51)];
        [dummyTextView setTextColor:creamColor];
        [dummyTextView setBackgroundColor:grayColor];
        [dummyTextView setFont:detailFont];
        //[folderTextView sizeToFit];
        [dummyTextView setText:[[@"Folder" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.folderName]];
        
        NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                               boldFontName, NSFontAttributeName,
                               foregroundColor, NSForegroundColorAttributeName, nil];
        
        NSMutableAttributedString *displayAttrString = [[NSMutableAttributedString alloc] initWithString:[[@"Folder" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.folderName] ];
       
        [displayAttrString setAttributes:attrs  range:NSMakeRange(0,@"Folder".length)];
       
        UITextView *folderTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        folderTextView.userInteractionEnabled = NO;
        [folderTextView setFrame:CGRectMake(31, 100, 290, 51)];
        [folderTextView setTextColor:creamColor];
        [folderTextView setBackgroundColor:grayColor];
        [folderTextView setFont:detailFont];
        //[folderTextView sizeToFit];
        [folderTextView setAttributedText:displayAttrString];
       
        
        NSMutableAttributedString *displayAttrString1=[[NSMutableAttributedString alloc] initWithString: [[@"Title" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.sptitle] ];
       
        [displayAttrString1 setAttributes:attrs range:NSMakeRange(0,@"Title".length)];
        
        UITextView *titleTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        titleTextView.userInteractionEnabled = NO;
        [titleTextView setFrame:CGRectMake(31, 170, 290, 51)];
        [titleTextView setTextColor:creamColor];
        [titleTextView setBackgroundColor:grayColor];
        [titleTextView setFont:detailFont];
        //[folderTextView sizeToFit];
       // [titleTextView setText:[[@"Title" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.sptitle]];
        [titleTextView setAttributedText:displayAttrString1];
        
        
        
        NSMutableAttributedString *displayAttrString2=[[NSMutableAttributedString alloc] initWithString:[[@"Login" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.login] ];
        
        [displayAttrString2 setAttributes:attrs range:NSMakeRange(0,@"Login".length)];
      
        UITextView *loginTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        loginTextView.userInteractionEnabled = NO;
        [loginTextView setFrame:CGRectMake(31, 240, 290, 51)];
        [loginTextView setTextColor:creamColor];
        [loginTextView setBackgroundColor:grayColor];
        [loginTextView setFont:detailFont];
        //[folderTextView sizeToFit];
        //[loginTextView setText:[[@"Login" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.login]];
        [loginTextView setAttributedText:displayAttrString2];
        
        
        NSMutableAttributedString *displayAttrString3=[[NSMutableAttributedString alloc] initWithString: [[@"Secret" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.passWord] ];
        [displayAttrString3 setAttributes:attrs range:NSMakeRange(0,@"Secret".length)];
        UITextView *passwordTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        passwordTextView.userInteractionEnabled = NO;
        [passwordTextView setFrame:CGRectMake(31, 310, 290, 51)];
        [passwordTextView setTextColor:creamColor];
        [passwordTextView setBackgroundColor:grayColor];
        [passwordTextView setFont:detailFont];
        //[folderTextView sizeToFit];
        //[passwordTextView setText:[[@"Secret" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.passWord]];
        [passwordTextView setAttributedText:displayAttrString3];
       
        
        
        
        NSMutableAttributedString *displayAttrString4=[[NSMutableAttributedString alloc] initWithString:[[@"URL" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.url]];
        [displayAttrString4 setAttributes:attrs range:NSMakeRange(0,@"URL".length)];
        UITextView *urlTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        urlTextView.userInteractionEnabled = NO;
        [urlTextView setFrame:CGRectMake(31, 380, 290, 51)];
        [urlTextView setTextColor:creamColor];
        [urlTextView setBackgroundColor:grayColor];
        [urlTextView setFont:detailFont];
        //[folderTextView sizeToFit];
        //[urlTextView setText:[[@"URL" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.url]];
        [urlTextView setAttributedText:displayAttrString4];
        
        [[self view] addSubview:dummyTextView];
        [[self view] addSubview:folderTextView];
        [[self view] addSubview:titleTextView];
        [[self view] addSubview:loginTextView];
        [[self view] addSubview:passwordTextView];
        [[self view] addSubview:urlTextView];
        
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem.tintColor = Rgb2UIColor(255, 253, 208);
    self.navigationItem.leftBarButtonItem.tintColor = Rgb2UIColor(255, 253, 208);

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
