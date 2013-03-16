//
//  APDetailStepThreeViewController.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-03-16.
//
//

#import <UIKit/UIKit.h>
@class Friend;

@interface APDetailStepThreeViewController : UIViewController
@property (weak, nonatomic) Friend *currentFriend;

@property (weak, nonatomic) IBOutlet UILabel *test;



@end
