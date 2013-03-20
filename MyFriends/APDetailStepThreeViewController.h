//
//  APDetailStepThreeViewController.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-03-16.
//
//

#import <UIKit/UIKit.h>
@class Friend;

@interface APDetailStepThreeViewController : UITableViewController
@property (weak, nonatomic) Friend *currentFriend;


@property (weak, nonatomic) IBOutlet UITextView *bestMemoryTextView;

@property (weak, nonatomic) IBOutlet UITextView *ifIGotaWishTextView;
@property (weak, nonatomic) IBOutlet UITextView *whenIGrowUpTextView;

@end
