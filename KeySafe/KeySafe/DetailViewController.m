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
#import "KSCrypto.h"
#import "NSString+MD5.h"
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

@interface DetailViewController ()


@end

@implementation DetailViewController

#pragma mark - Managing the detail item



- (void)configureView:(UIView *) mainView {
    // Update the user interface for the detail item.
    if (self.entry) {
        
        
        UIFont  *detailFont = [UIFont fontWithName:@"Helvetica Neue" size:17];
        UIColor *creamColor = Rgb2UIColor(255, 253, 208);
        UIColor *grayColor  = [UIColor grayColor];
        UIColor *defaultColor = [UIColor blackColor];
        UIFont  *boldFontName = [UIFont fontWithName:@"Helvetica-Bold" size:17];
        UIFont  *italicFont = [UIFont fontWithName:@"Helvetica-BoldOblique" size:17];
        
        //TODO: Yet to figure out this
        UITextView *dummyTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        dummyTextView.userInteractionEnabled = NO;
        [dummyTextView setFrame:CGRectMake(31, 50, 250, 51)];
        [dummyTextView setTextColor:creamColor];
        [dummyTextView setBackgroundColor:grayColor];
        [dummyTextView setFont:detailFont];
        //[folderTextView sizeToFit];
        [dummyTextView setText:[[@"Folder" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.folderName]];
        
        NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                               boldFontName, NSFontAttributeName,
                               [UIColor grayColor], NSForegroundColorAttributeName, nil];
        
        NSDictionary *subattrs = [NSDictionary dictionaryWithObjectsAndKeys:
                               italicFont, NSFontAttributeName,
                               defaultColor, NSForegroundColorAttributeName, nil];
        
        NSMutableAttributedString *displayAttrString = [[NSMutableAttributedString alloc] initWithString:[[@"Folder" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.folderName] attributes:subattrs];
       
        [displayAttrString setAttributes:attrs  range:NSMakeRange(0,@"Folder".length)];
       
       
        UITextView *folderTextView = [[UITextView alloc] initWithFrame:CGRectMake(31, 120, 250, 51)];
        folderTextView.userInteractionEnabled = NO;
        
       // [folderTextView setFrame:CGRectMake(31, 100, 250, 51)];
        
        CGRect frame = folderTextView.frame;
        frame.origin = CGPointMake(0.0f, 0.0f);
        folderTextView.frame = frame;
        [folderTextView setFrame:CGRectMake(31, 100, 250, 51)];
        [folderTextView setTextColor:[UIColor blackColor]];
        [folderTextView setBackgroundColor:[UIColor whiteColor]];
        [folderTextView setFont:detailFont];
        
        //[folderTextView sizeToFit];
        [folderTextView setAttributedText:displayAttrString];
        
        UITableView *folderTableView = [[UITableView alloc] initWithFrame:CGRectZero];
        folderTableView.userInteractionEnabled = NO;
        [folderTableView setFrame:CGRectMake(31, 450, 250, 51)];
        [folderTableView setBackgroundColor:grayColor];
        
        //[folderTextView sizeToFit];
        
        [self.view setBackgroundColor:Rgb2UIColor(255, 253, 250)];
        
        
        NSMutableAttributedString *displayAttrString1=[[NSMutableAttributedString alloc] initWithString: [[@"Title" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.sptitle] attributes:subattrs];
       
        [displayAttrString1 setAttributes:attrs range:NSMakeRange(0,@"Title".length)];
        
        UITextView *titleTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        titleTextView.userInteractionEnabled = NO;

        [titleTextView setFrame:CGRectMake(31, 170, 250, 51)];
        [titleTextView setTextColor:[UIColor blackColor]];
        [titleTextView setBackgroundColor:[UIColor whiteColor]];
        [titleTextView setFont:detailFont];
        //[folderTextView sizeToFit];
       // [titleTextView setText:[[@"Title" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.sptitle]];
        [titleTextView setAttributedText:displayAttrString1];
        
        
        
        NSMutableAttributedString *displayAttrString2=[[NSMutableAttributedString alloc] initWithString:[[@"Login" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.login] attributes:subattrs];
        
        [displayAttrString2 setAttributes:attrs range:NSMakeRange(0,@"Login".length)];
      
        UITextView *loginTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        loginTextView.userInteractionEnabled = NO;
        [loginTextView setFrame:CGRectMake(31, 240, 250, 51)];
        [loginTextView setTextColor:[UIColor blackColor]];
        [loginTextView setBackgroundColor:[UIColor whiteColor]];
        [loginTextView setFont:detailFont];
        //[folderTextView sizeToFit];
        //[loginTextView setText:[[@"Login" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.login]];
        [loginTextView setAttributedText:displayAttrString2];
        
        
        NSMutableAttributedString *displayAttrString3=[[NSMutableAttributedString alloc] initWithString: [[@"Secret" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.passWord] attributes:subattrs ];
        [displayAttrString3 setAttributes:attrs range:NSMakeRange(0,@"Secret".length)];
        UITextView *passwordTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        passwordTextView.userInteractionEnabled = NO;
        [passwordTextView setFrame:CGRectMake(31, 310, 250, 51)];
        [passwordTextView setTextColor:[UIColor blackColor]];
        [passwordTextView setBackgroundColor:[UIColor whiteColor]];
        [passwordTextView setFont:detailFont];
        //[folderTextView sizeToFit];
        //[passwordTextView setText:[[@"Secret" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.passWord]];
        [passwordTextView setAttributedText:displayAttrString3];
       
        
        
        
        NSMutableAttributedString *displayAttrString4=[[NSMutableAttributedString alloc] initWithString:[[@"URL" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.url] attributes:subattrs];
        [displayAttrString4 setAttributes:attrs range:NSMakeRange(0,@"URL".length)];
        UITextView *urlTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        urlTextView.userInteractionEnabled = NO;
        [urlTextView setFrame:CGRectMake(31, 380, 250, 51)];
        [urlTextView setTextColor:[UIColor blackColor]];
        [urlTextView setBackgroundColor:[UIColor whiteColor]];
        [urlTextView setFont:detailFont];
        //[folderTextView sizeToFit];
        //[urlTextView setText:[[@"URL" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.url]];
        [urlTextView setAttributedText:displayAttrString4];
        
        
        NSMutableAttributedString *displayAttrString5=[[NSMutableAttributedString alloc] initWithString:[[@"Notes" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.notes] attributes:subattrs];
        [displayAttrString5 setAttributes:attrs range:NSMakeRange(0,@"Notes".length)];
        UITextView *notesTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        notesTextView.userInteractionEnabled = NO;
        [notesTextView setFrame:CGRectMake(31, 450, 250, 70)];
        [notesTextView setTextColor:[UIColor blackColor]];
        [notesTextView setBackgroundColor:[UIColor whiteColor]];
        [notesTextView setFont:detailFont];
        //[folderTextView sizeToFit];
        //[urlTextView setText:[[@"URL" stringByAppendingString:@"\n"] stringByAppendingString:self.entry.url]];
        [notesTextView setAttributedText:displayAttrString5];
        
       // [[self view] addSubview:dummyTextView];
        [mainView addSubview:folderTextView];
        [[self view] addSubview:titleTextView];
        [[self view] addSubview:loginTextView];
        [[self view] addSubview:passwordTextView];
        [[self view] addSubview:urlTextView];
        [[self view] addSubview:notesTextView];
        //[[self view] addSubview:folderTableView];
        [self testCrypto];
        
                              
    }
}


-(void) testCrypto{
    
    KSCrypto *crypto = [[KSCrypto alloc]init];
    NSData * iv;
    NSData *salt;
    NSError *error;
    NSData *cipherData = [crypto encryptDataForData:[@"Chari is awesome and cool" dataUsingEncoding:NSUTF8StringEncoding]             password:@"Vishnu01" iv:&iv salt:&salt error:&error];
    
    NSLog(@" In Detail View Controller IV=%@ and Salt=%@", iv, salt);
    NSLog(@"Detail View Controller CipherText=%@", cipherData);
    
    NSData *plainData = [crypto decryptDataForData:cipherData password:@"Vishnu01" iv:iv salt:salt error:&error] ;
    
    
    NSString *plainText = [[NSString alloc] initWithData:plainData encoding:NSUTF8StringEncoding];
    NSLog(@"Detail View Controller PlainText=%@", plainText);
    
    NSLog(@"Hash of String %@ is %@", @"Vishnu01", [@"Vishnu01" MD5]);
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *contentView = [[UIView alloc] initWithFrame:applicationFrame];
    contentView.backgroundColor = Rgb2UIColor(255, 253, 250);
    [[self view] addSubview:contentView];
    //self.view.backgroundColor = Rgb2UIColor(255, 253, 250);
    self.navigationItem.rightBarButtonItem.tintColor = Rgb2UIColor(255, 253, 208);
    self.navigationItem.leftBarButtonItem.tintColor = Rgb2UIColor(255, 253, 208);

    self.spDAO = [[SPDatasebaseDAO alloc] init];
    [self configureView:self.view];
    
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
        
        [self configureView:self.view];
        
        NSLog(@"here is the id %@",self.entry.keyid);
        [self.spDAO updateSPEntryToDB:self.entry];
        
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // To populate the screen
    NSLog(@"In detail view Controller");
    
    AddEntryViewController  *addController = (AddEntryViewController  *)[segue destinationViewController] ;
    
    [addController setKeyEntry:self.entry];
    //[self configureView];
}

@end
