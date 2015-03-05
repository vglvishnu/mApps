//
//  AddEntryViewController.m
//  StorePass
//
//  Created by Vishnu on 2/9/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import "AddEntryViewController.h"
#import "SPStoreEntry.h"

@interface AddEntryViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@property (weak, nonatomic) IBOutlet UITextField *folderName;
@property (weak, nonatomic) IBOutlet UITextField *spTitle;


@property (weak, nonatomic) IBOutlet UITextField *login;


@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextField *url;
@property (weak, nonatomic) IBOutlet UITextView *notes;

@end

@implementation AddEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.keyEntry) {
        //self.detailDescriptionLabel.text = [self.detailItem description];
        
        self.folderName.text =  self.keyEntry.folderName;
        self.spTitle.text     = self.keyEntry.sptitle;
        self.login.text       = self.keyEntry.login;
        self.passWord.text    = self.keyEntry.passWord;
        self.url.text         = self.keyEntry.url;
        self.notes.text       = self.keyEntry.notes;
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //TODO:
    
    if(sender != self.saveButton) return;
    
    if(self.spTitle.text.length > 0 && self.folderName.text.length > 0 ) {
        
        //self.keyEntry = [[SPStoreEntry alloc] init];
        
        if(self.keyEntry == nil){
            self.keyEntry = [[SPStoreEntry alloc] init];
        }
        
        self.keyEntry.folderName = self.folderName.text;
        self.keyEntry.sptitle    = self.spTitle.text;
        self.keyEntry.login      = self.login.text;
        self.keyEntry.passWord   = self.passWord.text;
        self.keyEntry.url        = self.url.text;
        self.keyEntry.notes      = self.notes.text;
        
    }
    
}

@end
