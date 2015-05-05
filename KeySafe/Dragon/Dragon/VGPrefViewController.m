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
    self.lockTimeText = @"5 times";
    self.tolerableRetryCount = @"5 times";
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
    
//    NSLog(@" x= %f",parentView.frame.origin.x);
//    NSLog(@" y= %f",parentView.frame.origin.y);
//    NSLog(@" Width= %f",parentView.frame.size.width);
//    NSLog(@" Heigth= %f",parentView.frame.size.height);
    
    CGRect parentFrame = parentView.frame;
    parentFrame.size.height -=(parentFrame.size.height/2.7) ;
    parentFrame.origin.y    += 50;
    parentFrame.origin.x    += 6;
    parentFrame.size.width  -= (parentFrame.size.height/5.6);
   
    
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedRowIndex = indexPath ;
   // NSLog(@"==%lu",(unsigned long)[self.tableDS indexOfObject:@"2.5"]);
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
    
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.tableDS.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    if([indexPath row] ==0 ) {
   
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    //cell.layer.cornerRadius = 6;
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = @"Enable Touch";
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.textLabel.backgroundColor =[UIColor whiteColor];
    cell.imageView.backgroundColor =[UIColor whiteColor];
        
        CGRect frame = CGRectZero;
        frame.origin.x += 200;
        frame.origin.y += 6;
        
        
        self.enableTouchLogin = [[UISwitch alloc] initWithFrame:frame];
        
        
        
        [self.enableTouchLogin setThumbTintColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:255.0/255.0 alpha:1.0]];
        [self.enableTouchLogin setUserInteractionEnabled:YES];
        [self.enableTouchLogin setTintColor:[UIColor colorWithRed:204.0/255.0 green:229.0/255.0 blue:255.0/255.0 alpha:1.0]];
        [self.enableTouchLogin setOnTintColor:[UIColor colorWithRed:51.0/255.0 green: 153./255.0 blue:225.0/255.0 alpha:1.0]];
        [self.enableTouchLogin setOn:YES animated:YES];
        
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
        cell.detailTextLabel.text = @"5 mins";
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
        
//        CGRect frame = CGRectZero;
//        frame.origin.x += 200;
//        frame.origin.y += 6;
//        
//        self.pickLockTime = [[UIPickerView alloc] initWithFrame:frame];
//        
//        VGLockTimePickViewDelegate *lockTimeDelegate = [[VGLockTimePickViewDelegate alloc] initWithDataSource];
//        
//        [self.pickLockTime setDataSource:lockTimeDelegate];
//        [self.pickLockTime setDelegate:lockTimeDelegate];
//         self.pickLockTime.showsSelectionIndicator = YES;
//         self.pickLockTime.hidden = YES;
//        
//        [self addChildViewController:lockTimeDelegate];
//        
//        
//        [cell.contentView addSubview:self.pickLockTime];

        
    //    NSLog(@" Index= %ld", (long)[indexPath row]);
        return cell;
    }
    
    if([indexPath row] ==2 ) {
        
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        //cell.layer.cornerRadius = 6;
        
        cell.backgroundColor = [UIColor whiteColor];
        //cell.textLabel.text = @"Lock On Exit";
        cell.contentView.backgroundColor = [UIColor whiteColor];
        //cell.textLabel.backgroundColor =[UIColor whiteColor];
        //cell.imageView.backgroundColor =[UIColor whiteColor];
        
        if ([self.tableDS[[indexPath row]]  isEqual: @"2.5"]) {
            
            
            
            CGRect frame = CGRectMake(50,-20,200,100);
            
            self.pickLockTime = [[UIPickerView alloc] initWithFrame:frame];
            
//            VGLockTimePickViewDelegate *lockTimeDelegate = [[VGLockTimePickViewDelegate alloc] initWithDataSource];
            
            [self.pickLockTime setDataSource:self.lockTimeDelegate];
            [self.pickLockTime setDelegate:self.lockTimeDelegate];
            self.pickLockTime.showsSelectionIndicator = YES;
            self.pickLockTime.hidden = NO;
            
            [self addChildViewController:self.lockTimeDelegate];
            self.lockTimeText = self.lockTimeDelegate.selectedCategory;
          
            [cell.contentView addSubview:self.pickLockTime];
            
            
        } else {
        
        CGRect frame = CGRectZero;
        frame.origin.x += 200;
        frame.origin.y += 6;
        cell.textLabel.text = @"Lock On Exit";
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.textLabel.backgroundColor =[UIColor whiteColor];
        cell.imageView.backgroundColor =[UIColor whiteColor];
        
        self.lockOnExit = [[UISwitch alloc] initWithFrame:frame];
        
        
        
        [self.lockOnExit setThumbTintColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:255.0/255.0 alpha:1.0]];
        [self.lockOnExit setUserInteractionEnabled:YES];
        [self.lockOnExit setTintColor:[UIColor colorWithRed:204.0/255.0 green:229.0/255.0 blue:255.0/255.0 alpha:1.0]];
        [self.lockOnExit setOnTintColor:[UIColor colorWithRed:51.0/255.0 green: 153./255.0 blue:225.0/255.0 alpha:1.0]];
        [self.lockOnExit setOn:YES animated:YES];
        [self.lockOnExit setOpaque:NO];
        [cell.contentView addSubview:self.lockOnExit];
        }
        
     //   NSLog(@" Index= %ld", (long)[indexPath row]);
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
       
        
        cell.detailTextLabel.text = self.tolerableRetryCount;
        cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    
    if(([indexPath row] ==4)  || ([indexPath row] ==5 && ([self.tableDS indexOfObject:@"2.5"] != NSNotFound))) {
        
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        //cell.layer.cornerRadius = 6;
        
        
        cell.backgroundColor = [UIColor whiteColor];
        //cell.textLabel.text = @"Tolerable Retry";
        cell.contentView.backgroundColor = [UIColor whiteColor];
//        cell.textLabel.backgroundColor =[UIColor whiteColor];
//        cell.imageView.backgroundColor =[UIColor whiteColor];
//        cell.detailTextLabel.text = @"5 times";
        //cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
        
//        CGRect frame = CGRectZero;
//        frame.origin.x += 150;
//        frame.origin.y -= 10;
        CGRect sframe = CGRectMake(50,-20,200,100);
        
      
        
        self.pickTolarableRetry = [[UIPickerView alloc] initWithFrame:sframe];
        
//        VGTolarableRetryPickViewDelegate *tolorableRetryDelegate = [[VGTolarableRetryPickViewDelegate alloc] initWithDataSource];
        
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




@end
