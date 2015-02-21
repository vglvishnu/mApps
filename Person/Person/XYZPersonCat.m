//
//  XYZPersonCat.m
//  Person
//
//  Created by Vishnu on 1/13/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZPerson.h"
#import "XYZPersonCat.h"

@implementation XYZPerson (XYZPERSONCat)
//Test Clash: Since delloc is in clash with delloc method in NSObject, this has undefined behaviour

-(void) delloc {
    
    NSLog(@" XYZPerson is being delloacted from memory");
}

@end
