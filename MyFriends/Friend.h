//
//  Friend.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-03-21.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Friend : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * bestMemory;
@property (nonatomic, retain) NSString * birthDay;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * favoriteColor;
@property (nonatomic, retain) NSString * favoriteMovie;
@property (nonatomic, retain) NSString * favoriteMusic;
@property (nonatomic, retain) NSString * favoriteTVShow;
@property (nonatomic, retain) NSString * favoriteWebsite;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * hobby;
@property (nonatomic, retain) NSString * ifIgotOneWish;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) NSString * imageKey;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) NSString * school;
@property (nonatomic, retain) NSString * whenIgrowUp;

@end

