//
//  VGPrefViewController.m
//  Dragon
//
//  Created by Vishnu on 5/2/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import "VGPrefViewController.h"

@interface VGPrefViewController ()

@end

@implementation VGPrefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+ 8,self.view.frame.origin.y + 100,self.view.frame.size.width - (self.view.frame.size.width/6.7), self.view.frame.size.height /2.25)];
    CGRect frame = self.view.frame;
    frame.size.height -= 100;
    
    
        UIView *contentView = [[UIView alloc] initWithFrame:frame];
    [contentView setBackgroundColor:[UIColor lightGrayColor]];
    contentView.layer.cornerRadius = 6;
    [self.view addSubview:contentView];
    
    [self configurePrefTable:contentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark -  Configure Sell you

-(void) configurePrefTable:(UIView *) parentView {
    
    NSLog(@" x= %f",parentView.frame.origin.x);
    NSLog(@" y= %f",parentView.frame.origin.y);
    NSLog(@" Width= %f",parentView.frame.size.width);
    NSLog(@" Heigth= %f",parentView.frame.size.height);
    
    CGRect parentFrame = parentView.frame;
    parentFrame.size.height -=(parentFrame.size.height/2) ;
    parentFrame.origin.y    += 100;
    parentFrame.origin.x    += 6;
    parentFrame.size.width  -= (parentFrame.size.height/5.4);
    
    self.prefTableView = [[UITableView alloc] initWithFrame:parentFrame style:UITableViewStyleGrouped];
    self.prefTableView.autoresizesSubviews = YES;
    self.prefTableView.dataSource          = self;
    self.prefTableView.delegate            = self;
    self.prefTableView.backgroundColor     = [UIColor greenColor];
    self.prefTableView.layer.cornerRadius  = 6;
    [self.prefTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
   
                                              
    [parentView addSubview:self.prefTableView];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}




@end
