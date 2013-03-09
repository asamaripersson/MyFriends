//
//  APImageStorage.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-02-10.
//
//

#import <Foundation/Foundation.h>

@interface APImageStorage : NSObject
{
    NSMutableDictionary *dictionary;
}
+ (APImageStorage *)defaultImageStore;

- (void)setImage:(UIImage *)i forKey:(NSString *)s;

- (UIImage *)imageForKey:(NSString *)s;

- (void)deleteImageForKey:(NSString *)s;

- (NSString *)imagePathForKey:(NSString *)key;

@end
