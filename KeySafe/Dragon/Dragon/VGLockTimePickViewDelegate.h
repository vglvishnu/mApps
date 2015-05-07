//
//  VGLockTimePickViewDelegate.h
//  Dragon
//
//  Created by Vishnu on 4/30/15.
//  Copyright (c) 2015 CoolHead. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VGLockTimePickViewDelegate : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property NSString* selectedCategory;
@property UITableView *parentTableView;
@property NSIndexPath *ip;

-(id) initWithDataSource ;

@end
