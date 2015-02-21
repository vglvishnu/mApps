//
//  SPDatasebaseDAO.h
//  StorePass
//
//  Created by Vishnu on 2/12/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "SPStoreEntry.h"

@interface SPDatasebaseDAO : NSObject

@property (nonatomic) sqlite3 *storePassDB;

-(void) createDBIfNotExists ;
-(NSMutableArray *) getEntriesFromDB ;
-(void) insertSPEntryToDB:(SPStoreEntry *) spEntry;
-(NSMutableArray *) getFoldersFromDB ;

@end
