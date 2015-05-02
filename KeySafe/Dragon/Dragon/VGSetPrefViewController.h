//
//  VGSetPrefViewController.h
//  Dragon
//
//  Created by Vishnu on 4/29/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VGSetPrefViewController : UIViewController

@property (nonatomic) UITableView *prefTableVeiw;

@property (nonatomic) UISwitch *enableTouchLogin;
@property (nonatomic) UIPickerView *pickLockTime;
@property (nonatomic) UISwitch *lockOnExit;
@property (nonatomic) UIPickerView *pickTolarableRetry;

@end
