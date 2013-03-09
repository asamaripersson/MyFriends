//
//  APMeStorage.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-02-02.
//
//

#import <Foundation/Foundation.h>
@class Me;
@interface APMeStorage : NSObject

+(APMeStorage *)sharedStorage;

-(Me*)getMe;

-(Me*)createMeWithName:(NSString*)name lastname:(NSString*)lastName birthDay:(NSString*)birthday address:(NSString*)address email:(NSString*)email school:(NSString*)school hobby:(NSString*)hobby favoriteColor:(NSString*)favoriteColor favoriteMovie:(NSString*)movie favoriteMusic:(NSString*)music favoriteTvShow:(NSString*)tvShow image:(NSData*)image favoriteWebsite:(NSString*)webSite bestMemory:(NSString*)memory whenIgrowUp:(NSString*)whenIgrowUp ifIgotOneWish:(NSString*)wish phonenumber:(NSNumber*)number;
@end
