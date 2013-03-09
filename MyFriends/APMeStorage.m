//
//  APMeStorage.m
//  MyFriends
//
//  Created by Åsa Persson on 2013-02-02.
//
//

#import "APMeStorage.h"
#import "APCoreDataService.h"
#import "Me.h"
@implementation APMeStorage

{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

+(APMeStorage *)sharedStorage
{
    static APMeStorage *sharedStorage;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        sharedStorage = [[self alloc]init];
    });
    return sharedStorage;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        model = [[APCoreDataService  sharedService] getModel];
        context = [[APCoreDataService sharedService] getContext];
        
        //        [self loadAllFriends];
    }
    return self;
}

-(Me *)createMeWithName:(NSString *)name lastname:(NSString *)lastName birthDay:(NSString *)birthday address:(NSString *)address email:(NSString *)email school:(NSString *)school hobby:(NSString *)hobby favoriteColor:(NSString *)favoriteColor favoriteMovie:(NSString *)movie favoriteMusic:(NSString *)music favoriteTvShow:(NSString *)tvShow image:(NSData *)image favoriteWebsite:(NSString *)webSite bestMemory:(NSString *)memory whenIgrowUp:(NSString *)whenIgrowUp ifIgotOneWish:(NSString *)wish phonenumber:(NSNumber *)number
{
    Me *mySelf = [NSEntityDescription insertNewObjectForEntityForName:@"Me"
                                              inManagedObjectContext:context];
    mySelf.firstName = name;
    mySelf.lastName = lastName;
    mySelf.birthDay = birthday;
    mySelf.address = address;
    mySelf.email = email;
    mySelf.school = school;
    mySelf.hobby = hobby;
    mySelf.favoriteColor = favoriteColor;
    mySelf.favoriteMovie = movie;
    mySelf.favoriteMusic = music;
    mySelf.favoriteTVShow = tvShow;
    mySelf.favoriteWebsite = webSite;
    mySelf.bestMemory = memory;
    mySelf.whenIgrowUp = whenIgrowUp;
    mySelf.ifIgotOneWish = wish;
    mySelf.image = image;
    mySelf.phoneNumber = number;
    
    return mySelf;
}
-(Me *)getMe
{
    return [[[APCoreDataService sharedService] fetchDataWithEntity:@"Me"] lastObject];
}

@end
