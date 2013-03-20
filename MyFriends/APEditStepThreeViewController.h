//
//  APEditStepThreeViewController.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-03-16.
//
//

#import <UIKit/UIKit.h>
@class Friend;
@interface APEditStepThreeViewController : UITableViewController
@property (weak, nonatomic) Friend *currentFriend;
@property BOOL editMode;
@property (weak, nonatomic) IBOutlet UITextView *bestMemoryTextView;

@property (weak, nonatomic) IBOutlet UITextView *aWishTextView;

@property (weak, nonatomic) IBOutlet UITextView *whenIgrowUpTextView;


@end
