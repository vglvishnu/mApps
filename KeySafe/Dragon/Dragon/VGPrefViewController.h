//
//  VGPrefViewController.h
//  Dragon
//
//  Created by Vishnu on 5/2/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VGPrefViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) UITableView *prefTableView;

@property (nonatomic) UISwitch *enableTouchLogin;
@property (nonatomic) UIPickerView *pickLockTime;
@property (nonatomic) UISwitch *lockOnExit;
@property (nonatomic) UIPickerView *pickTolarableRetry;

@property (nonatomic) NSString *lockTimeText;
@property (nonatomic) NSString *tolerableRetryCount;

@end
