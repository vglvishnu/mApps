//
//  XYZPersonProtocol.h
//  Person
//
//  Created by Vishnu on 1/14/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#ifndef Person_XYZPersonProtocol_h
#define Person_XYZPersonProtocol_h


#endif



@protocol XYZPersonProtocol <NSObject>

-(void) sayHowdy:(NSString *)greetings;

@optional

-(NSMutableString*) sayGoodBye:(NSMutableString *)greetings;

@end