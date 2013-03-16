//
//  APCoreDataService.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-01-01.
//
//

#import <Foundation/Foundation.h>

@interface APCoreDataService : NSObject
+(APCoreDataService*) sharedService;

- (NSString *)path;

- (BOOL)saveChanges;

-(NSManagedObjectContext*)getContext;

-(NSManagedObjectModel*)getModel;

-(NSArray*)fetchDataWithEntity:(NSString*)entity;

-(NSArray *)fetchDataWithEntity:(NSString *)entity andPredicate:(NSPredicate *)predicate andSortDescriptors:(NSArray *)sortDescriptors;

@end
