//
//  GunaLikePerson.m
//  Person
//
//  Created by Vishnu on 1/11/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GunaLikePerson.h"


@implementation GunaLikePerson : XYZPerson

-(NSString*) shouteIt:(NSString*) greetings {
    
    NSString* returnString=[greetings uppercaseString];
    
    return returnString;
}

@end