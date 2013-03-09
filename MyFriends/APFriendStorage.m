//
//  APFriendStorage.m
//  MyFriends
//
//  Created by Åsa Persson on 2013-01-01.
//
//

#import "APFriendStorage.h"
#import "Friend.h"
#import "APCoreDataService.h"

@implementation APFriendStorage

{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

+(APFriendStorage *)sharedStorage
{
    static APFriendStorage *sharedStorage;
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



-(Friend *)createFriendWithName:(NSString *)name lastname:(NSString *)lastName birthDay:(NSString *)birthday address:(NSString *)address email:(NSString *)email school:(NSString *)school hobby:(NSString *)hobby favoriteColor:(NSString *)favoriteColor favoriteMovie:(NSString *)movie favoriteMusic:(NSString *)music favoriteTvShow:(NSString *)tvShow image:(UIImage *)image imageKey:(NSString *)imageKey favoriteWebsite:(NSString *)webSite bestMemory:(NSString *)memory whenIgrowUp:(NSString *)whenIgrowUp ifIgotOneWish:(NSString *)wish phonenumber:(NSNumber *)number
{
    Friend *f = [NSEntityDescription insertNewObjectForEntityForName:@"Friend"
                                               inManagedObjectContext:context];
    f.firstName = name;
    f.lastName = lastName;
    f.birthDay = birthday;
    f.address = address;
    f.email = email;
    f.school = school;
    f.hobby = hobby;
    f.favoriteColor = favoriteColor;
    f.favoriteMovie = movie;
    f.favoriteMusic = music;
    f.favoriteTVShow = tvShow;
    f.favoriteWebsite = webSite;
    f.bestMemory = memory;
    f.whenIgrowUp = whenIgrowUp;
    f.ifIgotOneWish = wish;
    f.image = nil;
    f.imageKey = imageKey;
    f.phoneNumber = number;
    NSLog(@"nuckeln %@",imageKey);
    return f;
}

-(void)removeFriend:(Friend *)friend
{
    [context deleteObject:friend];
}


-(NSArray *)allFriends
{
    return [[APCoreDataService sharedService] fetchDataWithEntity:@"Friend"];
}


//- (void)loadAllFriends
//{
//    if (!friendDictionary)
//    {
//        friendDictionary = [NSMutableDictionary dictionary];
//        
//        NSArray *result = [[APCoreDataService sharedService] fetchDataWithEntity:@"Friend"];
//        
//        for (Friend *friend in result)
//        {
//            [friendDictionary setObject:friend forKey:friend.firstName];
//        }
//    }
//}

@end

