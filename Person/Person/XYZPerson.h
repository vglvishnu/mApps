//
//  XYZPerson.h
//  Person
//
//  Created by Vishnu on 1/8/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#ifndef Person_XYZPerson_h
#define Person_XYZPerson_h


#endif

#import "XYZPersonProtocol.h"

@interface XYZPerson : NSObject <NSObject, XYZPersonProtocol>
@property NSString *firstName;
@property NSString *lastName;
@property(readonly) NSDate *lastUpdateDateTime;

- (void) sayHello:(NSString *) greetings;
- (void) saySomething:(NSString *) someGreetings;
- (id)initWithFirstName:(NSString *) aFirstName lastName:(NSString *) aLastName;
- (void) sayHowdy:(NSString *) greetings;

+(instancetype) personWithFirstAndLastName:(NSString *) afirstName lastName:(NSString *) aLastName;
@end