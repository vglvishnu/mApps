//
//  SPDatasebaseDAO.m
//  StorePass
//
//  Created by Vishnu on 2/12/15.
//  Copyright (c) 2015 Vishnu. All rights reserved.
//

#import "SPDatasebaseDAO.h"
#import "SPStoreEntry.h"

@interface SPDatasebaseDAO()

@property NSArray *dirPaths;
@property NSString *databasePath;
@property NSString *docDir;
@property NSMutableArray *spFolders;
@property NSMutableArray *spEntries;


@end

@implementation SPDatasebaseDAO


-(id) init {
    
    self = [super init];
    
    if(self) {
        
        self.spFolders = [[NSMutableArray alloc] init];
        self.spEntries  = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void) createDBIfNotExists {
    
    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _docDir   = _dirPaths[0];
    
    _databasePath = [[NSString alloc] initWithString:[_docDir stringByAppendingPathComponent:@"storepass.db"]];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    if([fileMgr fileExistsAtPath:_databasePath ] == NO) {
        
        const char *dbpath = [_databasePath UTF8String];
        
        if(sqlite3_open(dbpath, &_storePassDB) == SQLITE_OK) {
            
            char * errMSG;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS SPENTRY (ID INTEGER PRIMARY KEY AUTOINCREMENT, FOLDERNAME TEXT,SPTITLE TEXT, LOGIN TEXT, PASSWORD TEXT, URL TEXT, NOTES TEXT)";
            if(sqlite3_exec(_storePassDB, sql_stmt,NULL,NULL,&errMSG)!= SQLITE_OK) {
                NSLog(@"Failed to create table");
            } else {
                NSLog(@"Created table");
            }
            
            sqlite3_close(_storePassDB);
            
        } else {
            
            NSLog(@"Failed to open/create database");
        }
    }
    
}


-(NSMutableArray *) getEntriesFromDB {
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    NSLog(@"Entering getEntriesFromDB");
    if(sqlite3_open(dbpath,&_storePassDB )== SQLITE_OK) {
        
        NSString *querySQL = [NSString stringWithFormat:@"SELECT FOLDERNAME,SPTITLE,LOGIN,PASSWORD,URL,NOTES,ID FROM SPENTRY" ];
        const char *quert_stmt = [querySQL UTF8String];
        
        if(sqlite3_prepare_v2(_storePassDB, quert_stmt, -1, &statement, NULL) == SQLITE_OK) {
            
            while(sqlite3_step(statement) == SQLITE_ROW) {
                NSLog(@" From table = %s",(const char *) sqlite3_column_text(statement, 0));
                
                
                
                SPStoreEntry *spEntry = [SPStoreEntry createSPEntry:[[NSString alloc]
                                                                     initWithUTF8String:
                                                                     (const char *) sqlite3_column_text(
                                                                                                        statement, 0)] sptitle:[[NSString alloc]
                                                                                                                                initWithUTF8String:
                                                                                                                                (const char *) sqlite3_column_text(
                                                                                                                                                                   statement, 1)] login:[[NSString alloc]
                                                                                                                                                                                         initWithUTF8String:
                                                                                                                                                                                         (const char *) sqlite3_column_text(
                                                                                                                                                                                                                            statement, 2)] passWord:[[NSString alloc]
                                                                                                                                                                                                                                                     initWithUTF8String:
                                                                                                                                                                                                                                                     (const char *) sqlite3_column_text(
                                                                                                                                                                                                                                                                                        statement, 3)] url:[[NSString alloc]
                                                                                                                                                                                                                                                                                                            initWithUTF8String:
                                                                                                                                                                                                                                                                                                            (const char *) sqlite3_column_text(
                                                                                                                                                                                                                                                                                                                                               statement, 4)] notes:[[NSString alloc]
                                                                                                                                                                                                                                                                                                                                                                     initWithUTF8String:
                                                                                                                                                                                                                                                                                                                                                                     (const char *) sqlite3_column_text(
                                                                                                                                                                                                                                                                                                                                                                                                        statement, 5)]  keyid:[[NSNumber alloc]
                                                                                                                                                                                                                                                                                                                                                                                                                                initWithInteger:
                                                                                                                                                                                                                                                                                                                                                                                                                               sqlite3_column_int(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  statement, 6)]];
                
                
                
                NSLog(@"Entry value title %s", sqlite3_column_text(statement, 1));
                NSLog(@"Entry value id %d", sqlite3_column_int(statement, 6));
                
                [self.spEntries addObject:spEntry];
                
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_storePassDB);
        
    } else {
        NSLog(@"Open failed");
    }
    
    return self.spEntries;
}


-(NSMutableArray *) getFoldersFromDB {
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    NSLog(@"Entering readFromStoreDB");
    if(sqlite3_open(dbpath,&_storePassDB )== SQLITE_OK) {
        
        NSString *querySQL = [NSString stringWithFormat:@"SELECT DISTINCT FOLDERNAME FROM SPENTRY" ];
        const char *quert_stmt = [querySQL UTF8String];
        
        if(sqlite3_prepare_v2(_storePassDB, quert_stmt, -1, &statement, NULL) == SQLITE_OK) {
            
            while(sqlite3_step(statement) == SQLITE_ROW) {
                NSLog(@" From table = %s",(const char *) sqlite3_column_text(statement, 0));
                
                
                NSString *spfolder = [[NSString alloc]
                                      initWithUTF8String:
                                      (const char *) sqlite3_column_text(
                                                                         statement, 0)];
                
                
                [self updateSPFolderObject:spfolder];
                               
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_storePassDB);
        
    } else {
        NSLog(@"Open failed");
    }
    
    return self.spFolders;
}


-(void) insertSPEntryToDB:(SPStoreEntry *) spEntry {
    
    
    sqlite3_stmt *statment;
    const char *dbpath = [_databasePath UTF8String];
    if ( sqlite3_open(dbpath,&_storePassDB) == SQLITE_OK) {
        
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO SPENTRY (FOLDERNAME,SPTITLE,LOGIN,PASSWORD,URL,NOTES) VALUES (\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\")", spEntry.folderName, spEntry.sptitle, spEntry.login,spEntry.passWord,spEntry.url,spEntry.notes];
        
        const char * insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_storePassDB, insert_stmt, -1, &statment, NULL);
        
        if(sqlite3_step(statment) == SQLITE_DONE) {
            
            NSLog(@"Insert to database success");
        } else {
            NSLog(@"Failed to insert in database");
        }
        
        sqlite3_finalize(statment);
        sqlite3_close(_storePassDB);
        
    }

}

-(void) updateSPFolderObject:(NSString *) spfolder {
    
    if(self.spFolders.count == 0) {
        [self.spFolders addObject:spfolder];
    }
    
    if([self.spFolders indexOfObject:spfolder] == NSNotFound) {
        [self.spFolders addObject:spfolder];
        
    } else {
        NSLog(@"<<<<<<Folder  %@ already exists >>>>>>>>", spfolder);
    }
    
}

@end
