//
//  APFriendStorage.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-01-01.
//
//

#import <Foundation/Foundation.h>
@class Friend;

@interface APFriendStorage : NSObject

+(APFriendStorage *)sharedStorage;


//nickName
-(Friend*)createFriendWithName:(NSString*)name lastname:(NSString*)lastName birthDay:(NSString*)birthday address:(NSString*)address email:(NSString*)email school:(NSString*)school hobby:(NSString*)hobby favoriteColor:(NSString*)favoriteColor favoriteMovie:(NSString*)movie favoriteMusic:(NSString*)music favoriteTvShow:(NSString*)tvShow image:(UIImage*)image imageKey:(NSString*)imageKey favoriteWebsite:(NSString*)webSite bestMemory:(NSString*)memory whenIgrowUp:(NSString*)whenIgrowUp ifIgotOneWish:(NSString*)wish phonenumber:(NSString*)number;

-(NSArray *)allFriends;

-(void)removeFriend:(Friend *)friend;

//- (void)loadAllFriends;

@end

