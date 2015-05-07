//
//  VGTolarableRetryPickViewDelegateViewController.h
//  Dragon
//
//  Created by Vishnu on 5/1/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VGTolarableRetryPickViewDelegate : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
 @property NSString *selectedCategory;
 @property UITableView *parentTableView;
 @property NSIndexPath *ip;
-(id) initWithDataSource ;
@end
