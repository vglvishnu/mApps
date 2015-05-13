//
//  VGPrefViewController.m
//  Dragon
//
//  Created by Vishnu on 5/2/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import "VGPrefViewController.h"
#import "VGLockTimePickViewDelegate.h"
#import "VGTolarableRetryPickViewDelegate.h"

@interface VGPrefViewController ()
@property NSIndexPath *selectedRowIndex;
@property NSMutableArray *tableDS;
@property VGLockTimePickViewDelegate *lockTimeDelegate;
@property  VGTolarableRetryPickViewDelegate *tolorableRetryDelegate ;
@end

@implementation VGPrefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+ 8,self.view.frame.origin.y + 100,self.view.frame.size.width - (self.view.frame.size.width/6.7), self.view.frame.size.height /2.25)];
    CGRect frame = self.view.frame;
    frame.size.height -= 50;
    //frame.origin.x    +=10;
    
    
    
    UIView *contentView = [[UIView alloc] initWithFrame:frame];
    [contentView setBackgroundColor:[UIColor whiteColor]];
    contentView.layer.cornerRadius = 6;
    self.lockTimeText = @"5 mins";
    self.tolerableRetryCount = @"5";
    [self.view addSubview:contentView];
    self.tableDS = [[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3", nil];
    self.lockTimeDelegate = [[VGLockTimePickViewDelegate alloc] initWithDataSource];
    self.tolorableRetryDelegate = [[VGTolarableRetryPickViewDelegate alloc] initWithDataSource];
    
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
    
    
    CGRect parentFrame = parentView.frame;
    parentFrame.size.height -=(parentFrame.size.height/2.5) ;
    parentFrame.origin.y    += 250;
    parentFrame.origin.x    += 6;
    parentFrame.size.width  -= 100;
   
    NSLog(@"parentFrame.origin.x %f",parentFrame.origin.x);
    NSLog(@"parentFrame.origin.y %f",parentFrame.origin.y);
    NSLog(@"parentFrame.size.height %f",parentFrame.size.height);
    NSLog(@"parentFrame.size.width %f",parentFrame.size.width);
    
    self.prefTableView = [[UITableView alloc] initWithFrame:parentView.frame style:UITableViewStyleGrouped];
    self.prefTableView.frame = CGRectMake(0,10,self.view.frame.size.width - 30,self.view.frame.size.height-200);
    self.prefTableView.autoresizesSubviews = YES;
    self.prefTableView.dataSource          = self;
    self.prefTableView.delegate            = self;
    self.prefTableView.backgroundColor     = [UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:255.0/255.0 alpha:1.0];
    //self.prefTableView.backgroundColor     = [UIColor lightGrayColor];
    self.prefTableView.layer.cornerRadius  = 6;
    [self.prefTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
   
    self.tolorableRetryDelegate.parentTableView = self.prefTableView;
    self.lockTimeDelegate.parentTableView = self.prefTableView;
    [parentView addSubview:self.prefTableView];
    
}

#pragma mark - Table View


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedRowIndex = indexPath ;

    if([indexPath row] == 1) {
        NSInteger ind = [self.tableDS indexOfObject:@"2.5"];
        if(ind == NSNotFound) {
        NSInteger row = 2;
        NSInteger section = 0;
        [self.tableDS insertObject:@"2.5" atIndex:2];
        NSIndexPath *aindexPath = [NSIndexPath indexPathForRow:row inSection:section];
        [tableView beginUpdates];
           [tableView insertRowsAtIndexPaths:@[aindexPath] withRowAnimation:UITableViewRowAnimationTop];
        [tableView endUpdates];

        NSInteger ind2 =[self.tableDS indexOfObject:@"3.5"];
            if(ind2 != NSNotFound) {
                  NSLog(@" Deleting index Ind2 ==%li", (long)ind2);
                 [self.tableDS removeObjectAtIndex:ind2];
                 NSIndexPath *bindexPath = [NSIndexPath indexPathForRow:ind2 inSection:section];
                 [tableView beginUpdates];
                    [tableView deleteRowsAtIndexPaths:@[bindexPath] withRowAnimation:UITableViewRowAnimationTop];
                [tableView endUpdates];
            }
                } else {
            NSInteger ind = [self.tableDS indexOfObject:@"2.5"];
            NSInteger row = 2;
            NSInteger section = 0;
            [self.tableDS removeObjectAtIndex:ind];
            NSIndexPath *aindexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [tableView beginUpdates];
            [tableView deleteRowsAtIndexPaths:@[aindexPath] withRowAnimation:UITableViewRowAnimationTop];
            [tableView endUpdates];
            
        }
    }
    
    if([indexPath row] == 2) {
        NSInteger ind = [self.tableDS indexOfObject:@"2.5"];
        if(ind != NSNotFound) {
           //  NSIndexPath *aindexPath = [NSIndexPath indexPathForRow:1 inSection:0];
            NSLog(@"I'm here");
            [tableView beginUpdates];
            [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:1 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
            [tableView endUpdates];
            }
        
    }

    
    if([indexPath row] == 3 ) {
        NSInteger ind = [self.tableDS indexOfObject:@"3.5"];
        if(ind == NSNotFound) {
            NSInteger row = 4;
            NSInteger section = 0;
            [self.tableDS insertObject:@"3.5" atIndex:4];
            NSIndexPath *aindexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [tableView beginUpdates];
            [tableView insertRowsAtIndexPaths:@[aindexPath] withRowAnimation:UITableViewRowAnimationTop];
             [tableView endUpdates];
            NSInteger ind2 =[self.tableDS indexOfObject:@"2.5"];
            if(ind2 != NSNotFound) {
                NSLog(@" Deleting index Ind2 ==%li", (long)ind2);
                [self.tableDS removeObjectAtIndex:ind2];
                 NSIndexPath *bindexPath = [NSIndexPath indexPathForRow:ind2 inSection:section];
                [tableView beginUpdates];
                [tableView deleteRowsAtIndexPaths:@[bindexPath] withRowAnimation:UITableViewRowAnimationTop];
                [tableView endUpdates];
                
            }
           
            
        }else {
            NSInteger ind = [self.tableDS indexOfObject:@"3.5"];
            NSInteger row = 4;
            NSInteger section = 0;
            [self.tableDS removeObjectAtIndex:ind];
             NSIndexPath *aindexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [tableView beginUpdates];
            [tableView deleteRowsAtIndexPaths:@[aindexPath] withRowAnimation:UITableViewRowAnimationTop];
            [tableView endUpdates];
            
        }
    }

    
    if([indexPath row] == 4) {
        NSInteger ind = [self.tableDS indexOfObject:@"3.5"];
        if(ind == NSNotFound) {
            NSInteger row = 5;
            NSInteger section = 0;
            [self.tableDS insertObject:@"3.5" atIndex:5];
            NSIndexPath *aindexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [tableView beginUpdates];
             [tableView insertRowsAtIndexPaths:@[aindexPath] withRowAnimation:UITableViewRowAnimationTop];
            [tableView endUpdates];
            NSInteger ind2 =[self.tableDS indexOfObject:@"2.5"];
            if(ind2 != NSNotFound) {
                [self.tableDS removeObjectAtIndex:ind2];
                  NSIndexPath *bindexPath = [NSIndexPath indexPathForRow:ind2 inSection:section];
                 [tableView beginUpdates];
                   [tableView deleteRowsAtIndexPaths:@[bindexPath] withRowAnimation:UITableViewRowAnimationTop];
                [tableView endUpdates];

            }
            
        }else {
            NSInteger ind = [self.tableDS indexOfObject:@"3.5"];
            NSInteger row = 5;
            NSInteger section = 0;
            [self.tableDS removeObjectAtIndex:ind];
            NSIndexPath *aindexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [tableView beginUpdates];
            [tableView deleteRowsAtIndexPaths:@[aindexPath] withRowAnimation:UITableViewRowAnimationTop];
            [tableView endUpdates];
            
        }
    }

}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //check if the index actually exists
    
//    for (int i = 0; i < [self.tableDS count]; i++)
//    {
//        NSLog(@"DS = %@ , index = %i",[self.tableDS objectAtIndex:i],i);
//    }
    
    if ([indexPath row] ==2 ) {
    //   NSLog(@"DS = %@",self.tableDS[[indexPath row]]);
            if ([self.tableDS[[indexPath row]] isEqual:@"2.5"]) {
//                NSLog(@" ======Increasing Size=========");
                return 100;
            }
     }
    
    if ([indexPath row] ==4 ) {
        
        if ([self.tableDS[[indexPath row]] isEqual:@"3.5"]) {
//            NSLog(@" ======Increasing Size=========");
            return 100;
        }

        
    }
    
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.tableDS.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    if([indexPath row] ==0 ) {
        
        CGRect tframe = tableView.frame;
        tframe.size.width -=1000;
        //frame.origin.y += 6;
        
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    //cell.layer.cornerRadius = 6;
    cell.frame = tframe;
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = @"Enable Touch";
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.textLabel.backgroundColor =[UIColor whiteColor];
    cell.imageView.backgroundColor =[UIColor whiteColor];
    cell.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;

        
        self.enableTouchLogin = [[UISwitch alloc] init];
        
      
        CGSize switchSize = [self.enableTouchLogin sizeThatFits:CGSizeZero];
         self.enableTouchLogin.frame = CGRectMake(cell.contentView.bounds.size.width - switchSize.width - 10.0f,
                                  (cell.contentView.bounds.size.height - switchSize.height) / 2.0f,
                                  switchSize.width,
                                  switchSize.height);
        
        self.enableTouchLogin.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        
        
       [self.enableTouchLogin setThumbTintColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:255.0/255.0 alpha:1.0]];
        
        
        [self.enableTouchLogin setUserInteractionEnabled:YES];
        [self.enableTouchLogin setTintColor:[UIColor colorWithRed:204.0/255.0 green:229.0/255.0 blue:255.0/255.0 alpha:1.0]];
        
        
        [self.enableTouchLogin setOnTintColor:[UIColor colorWithRed:51.0/255.0 green: 153./255.0 blue:225.0/255.0 alpha:1.0]];
        
        //[self.enableTouchLogin setOnTintColor:[UIColor greenColor]];
        [self.enableTouchLogin setOn:YES animated:YES];
        
        [self.enableTouchLogin addTarget:self action:@selector(touchLoginSwitchChanged:) forControlEvents:UIControlEventValueChanged];
        
        [cell.contentView addSubview:self.enableTouchLogin];

    
  //  NSLog(@" Index= %ld", (long)[indexPath row]);
        return cell;
    }
    
    if([indexPath row] ==1 ) {
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        //cell.layer.cornerRadius = 6;
        
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.text = @"Lock Time";
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.textLabel.backgroundColor =[UIColor whiteColor];
        cell.imageView.backgroundColor =[UIColor whiteColor];
        cell.detailTextLabel.text = self.lockTimeText;
        self.lockTimeDelegate.ip = indexPath;
        cell.selectionStyle = UITableViewCellAccessoryDisclosureIndicator;
        cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
        

        return cell;
    }
    
    if([indexPath row] ==2 ) {
        
        UITableViewCell *cell = [[UITableViewCell alloc] init];

        
        cell.backgroundColor = [UIColor whiteColor];

        cell.contentView.backgroundColor = [UIColor whiteColor];
        if ([self.tableDS[[indexPath row]]  isEqual: @"2.5"]) {
            
            
            
        
            CGRect sframe = CGRectMake(50,-20,200,90);
            self.pickLockTime = [[UIPickerView alloc] initWithFrame:sframe];
            self.lockTimeText = self.lockTimeDelegate.selectedCategory;
            
            [self.pickLockTime setDataSource:self.lockTimeDelegate];
            [self.pickLockTime setDelegate:self.lockTimeDelegate];
             self.pickLockTime.showsSelectionIndicator = YES;
             self.pickLockTime.hidden = NO;
            
            [self addChildViewController:self.lockTimeDelegate];
            
          
            [cell.contentView addSubview:self.pickLockTime];
            
            
        } else {
        
       
        cell.textLabel.text = @"Lock On Exit";
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.textLabel.backgroundColor =[UIColor whiteColor];
        cell.imageView.backgroundColor =[UIColor whiteColor];
        
        self.lockOnExit = [[UISwitch alloc] init];
        
            
        CGSize switchSize = [self.lockOnExit sizeThatFits:CGSizeZero];
        self.lockOnExit.frame = CGRectMake(cell.contentView.bounds.size.width - switchSize.width - 10.0f,
                                                     (cell.contentView.bounds.size.height - switchSize.height) / 2.0f,
                                                     switchSize.width,
                                                     switchSize.height);
         self.lockOnExit.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        
        [self.lockOnExit setThumbTintColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:255.0/255.0 alpha:1.0]];
        [self.lockOnExit setUserInteractionEnabled:YES];
        [self.lockOnExit setTintColor:[UIColor colorWithRed:204.0/255.0 green:229.0/255.0 blue:255.0/255.0 alpha:1.0]];
        [self.lockOnExit setOnTintColor:[UIColor colorWithRed:51.0/255.0 green: 153./255.0 blue:225.0/255.0 alpha:1.0]];
        [self.lockOnExit setOn:YES animated:YES];
            
         [self.lockOnExit addTarget:self action:@selector(lockOnExitSwitchChanged:) forControlEvents:UIControlEventValueChanged];
        [self.lockOnExit setOpaque:NO];
        [cell.contentView addSubview:self.lockOnExit];
        }
        
        return cell;
    }
    
    if(([indexPath row] ==3) || ([indexPath row] ==4 && ([self.tableDS indexOfObject:@"2.5"] != NSNotFound))) {
        
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        //cell.layer.cornerRadius = 6;

        
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.text = @"Tolerable Retry";
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.textLabel.backgroundColor =[UIColor whiteColor];
        cell.imageView.backgroundColor =[UIColor whiteColor];
       
        self.tolorableRetryDelegate.ip = indexPath;
        cell.detailTextLabel.text = self.tolerableRetryCount;
        cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    
    if(([indexPath row] ==4)  || ([indexPath row] ==5 && ([self.tableDS indexOfObject:@"2.5"] != NSNotFound))) {
        
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        
        
        cell.backgroundColor = [UIColor whiteColor] ;
        cell.contentView.backgroundColor = [UIColor whiteColor];
        CGRect sframe = CGRectMake(50,-20,200,90);
        
      
        
        self.pickTolarableRetry = [[UIPickerView alloc] initWithFrame:sframe];
        
        
        self.tolerableRetryCount = self.tolorableRetryDelegate.selectedCategory;
        
        [self.pickTolarableRetry setDataSource:self.tolorableRetryDelegate];
        [self.pickTolarableRetry setDelegate:self.tolorableRetryDelegate];
        self.pickTolarableRetry.showsSelectionIndicator = YES;
        self.pickTolarableRetry.hidden = NO;
        
        [self addChildViewController:self.tolorableRetryDelegate];
        
        [cell.contentView addSubview:self.pickTolarableRetry];
        
     //   NSLog(@" Index= %ld", (long)[indexPath row]);
        return cell;
    }

    
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


-(void) touchLoginSwitchChanged:(id)sender {
    UISwitch* switcher = (UISwitch*)sender;
    BOOL value = switcher.on;
    // Store the value and/or respond appropriately
  //  NSLog(@" Value = %@",value?"Y":"N");
}

-(void) lockOnExitSwitchChanged:(id)sender {
    UISwitch* switcher = (UISwitch*)sender;
    BOOL value = switcher.on;
    // Store the value and/or respond appropriately
    //NSLog(@" Value = %@",value?"Y":"N");
}


@end
